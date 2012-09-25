require "clouseau/detectors/python"

module Clouseau
  class Django < Python
    file "manage.py", "settings.py"

    framework :django
    memory 128
  end
end
