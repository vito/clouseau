module Clouseau
  class DotNet < Detector
    file "web.config"

    framework :dotnet
    memory 128
  end
end
