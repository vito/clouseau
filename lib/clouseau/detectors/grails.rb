require "clouseau/detectors/spring"

module Clouseau
  class Grails < Spring
    zip "*.war" do |file|
      file.name =~ /WEB-INF\/lib\/grails-web.*\.jar/
    end

    framework :grails
  end
end
