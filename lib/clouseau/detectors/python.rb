module Clouseau
  class Python < Detector
    file "wsgi.py"

    language :python
    memory 64
  end
end
