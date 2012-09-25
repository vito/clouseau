require "clouseau/detectors/rack"

module Clouseau
  class Rails < Rack
    file "config/environment.rb"

    memory 256
  end
end
