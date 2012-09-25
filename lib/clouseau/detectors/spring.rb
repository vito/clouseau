require "clouseau/detectors/java"

module Clouseau
  class Spring < Java
    zip "*.war" do |file|
      case file.name
      when /WEB-INF\/classes\/org\/springframework/,
          /WEB-INF\/lib\/spring-core.*\.jar/,
          /WEB-INF\/lib\/org\.springframework\.core.*\.jar/
        true
      end
    end

    framework :spring
  end
end
