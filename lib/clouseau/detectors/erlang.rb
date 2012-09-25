module Clouseau
  class Erlang < Detector
    glob "releases/*/*.rel", "releases/*/*.boot"

    language :erlang
    memory 64
  end
end
