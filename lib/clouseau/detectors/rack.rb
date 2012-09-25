require "clouseau/detectors/ruby"

module Clouseau
  class Rack < Ruby
    file "config.ru"

    memory 128
  end
end
