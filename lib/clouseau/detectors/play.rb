require "clouseau/detectors/java"

module Clouseau
  class Play < Java
    zip "*.zip" do |file|
      file.name =~ /lib\/play\..*\.jar/
    end

    framework :play
    memory 256
  end
end
