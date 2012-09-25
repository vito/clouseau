require "clouseau/detectors/spring"

module Clouseau
  class Lift < Spring
    zip "*.war" do |file|
      file.name =~ /WEB-INF\/lib\/lift-webkit.*\.jar/
    end

    framework :lift
  end
end
