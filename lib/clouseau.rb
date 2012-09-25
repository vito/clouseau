require "clouseau/detector"
require "clouseau/detectors"

module Clouseau
  class << self
    def detect(path)
      detectors.find do |d|
        d.new.detect(path)
      end
    end
  end
end
