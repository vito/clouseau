require "zip/zipfilesystem"

module Clouseau
  def self.detectors
    @detectors ||= []
  end

  class Detector
    class << self
      def inherited(cls)
        idx = 
          Clouseau.detectors.index { |d|
            (cls <=> d) == -1
          }

        Clouseau.detectors.insert(idx || 0, cls)
      end

      # set detected framework name
      def framework(name)
        suggestions[:framework] = name
      end

      # set valid/suggested runtime names
      #
      # names can be globs (i.e. node*)
      def runtime(*names)
        suggestions[:runtimes] = names
      end
      alias :runtimes :runtime

      # set suggested memory
      def memory(size)
        suggestions[:memory] = size
      end

      # check for given filenames
      #
      # if given a block, it is called with each file's contents, and if it
      # ever returns true, it is a match
      def file(*files, &check)
        detection << proc { |path|
          files.all? { |f|
            file = "#{path}/#{f}"

            if File.exists?(file)
              !check || check.call(File.read(file))
            end
          }
        }
      end

      # check for files described by glob
      #
      # if given a block, it is called with each file's contents, and if it
      # ever returns true, it is a match
      def glob(*globs, &check)
        detection << proc { |path|
          globs.all? do |glob|
            files = Dir.glob("#{path}/#{glob}")

            unless files.empty?
              !check || files.any? { |f|
                check.call(File.read(f))
              }
            end
          end
        }
      end

      def zip(glob, &check)
        detection << proc { |path|
          archives =
            if File.fnmatch(glob, path)
              [path]
            else
              Dir.glob("#{path}/#{glob}")
            end

          archives.any? do |f|
            found = false

            Zip::ZipFile.foreach(f) do |entry|
              if check.call(entry)
                found = true
                break
              end
            end

            found
          end
        }
      end

      def detection
        @detection ||= []
      end

      private

      def suggestions
        @suggestions ||= {}
      end
    end

    def detect(path)
      self.class.detection.any? do |d|
        d.call(path)
      end
    end
  end
end
