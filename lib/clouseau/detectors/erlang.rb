module Clouseau
  class Erlang < Detector
    glob "releases/*/*.rel", "releases/*/*.boot"

    framework "otp_rebar"
    memory 64
  end
end
