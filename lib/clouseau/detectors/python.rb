module Clouseau
  class Python < Detector
    file "wsgi.py"

    runtime "python*"
    framework "wsgi"
    memory 64
  end
end
