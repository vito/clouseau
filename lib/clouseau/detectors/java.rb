module Clouseau
  class Java < Detector
    glob "*.war"
    file "WEB-INF/web.xml"

    framework "java_web"
    runtime "java*"
    memory 512
  end
end
