require "clouseau/detectors/ruby"

module Clouseau
  class Sinatra < Ruby
    glob "*.rb" do |file|
      file =~ /^\s*require[\s\(]*['"]sinatra(\/base)?['"]/
    end

    memory 128
  end
end