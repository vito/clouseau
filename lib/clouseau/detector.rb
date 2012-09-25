require "zip/zipfilesystem"

module Clouseau
  # array of registered detectors, in the order they'll be tried
  #
  # see Detector.inherited
  def self.detectors
    @detectors ||= []
  end

  class Detector
    class << self
      attr_accessor :framework_name, :language_name, :memory_suggestion

      # each detection technique; an array of blocks which when called with
      # a path yield true or false
      def detection
        @detection ||= []
      end

      # name of the detected framework
      def framework_name
        @framework_name || parent(:framework_name)
      end

      # name of the detected language
      def language_name
        @language_name || parent(:language_name)
      end

      # suggested minimum memory allocation for an application of this type
      def memory_suggestion
        @memory_suggestion || parent(:memory_suggestion)
      end

      private

      # register the detector, ensuring it's prioritized over its superclass
      def inherited(cls)
        idx =
          Clouseau.detectors.index { |d|
            (cls <=> d) == -1
          }

        Clouseau.detectors.insert(idx || 0, cls)
      end

      # set detected framework name
      def framework(name)
        self.framework_name = name
      end

      # set detected language
      def language(name)
        self.language_name = name
      end

      # set suggested memory
      def memory(size)
        self.memory_suggestion = size
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
              !check || files.any? { |f| check.call(f) }
            end
          end
        }
      end

      # check for an archive (i.e. .war, .zip, .jar)
      #
      # if given a block, it is called with each entry in the archive, and if
      # it ever returns true, it is a match
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

      def parent(meth)
        if superclass.respond_to? meth
          superclass.send(meth)
        end
      end
    end

    # run through the detection methods and return `true' if one matches
    def detect(path)
      self.class.detection.any? do |d|
        d.call(path)
      end
    end
  end
end
