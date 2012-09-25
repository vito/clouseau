module Clouseau
  class PHP < Detector
    glob "*.php"

    language :php
    memory 128
  end
end
