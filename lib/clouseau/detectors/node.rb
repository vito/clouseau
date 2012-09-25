module Clouseau
  class Node < Detector
    file "server.js"
    file "app.js"
    file "index.js"
    file "main.js"

    language :node
    memory 64
  end
end
