module Clouseau
  class Ruby < Detector
    glob "*.rb"

    runtime "ruby*", "rbx*", "jruby*"
    memory 128
  end
end
