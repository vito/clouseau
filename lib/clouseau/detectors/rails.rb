require "clouseau/detectors/rack"

module Clouseau
  class Rails < Rack
    file "config/environment.rb"

    framework :rails
    memory 256
  end
end
