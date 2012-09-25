require "clouseau/detectors/ruby"

module Clouseau
  class Rack < Ruby
    file "config.ru"

    framework :rack
    memory 128
  end
end
