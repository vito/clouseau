module Clouseau
  class Java < Detector
    glob "*.war"
    file "WEB-INF/web.xml"

    language :java
    memory 512
  end
end
