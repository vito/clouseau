Dir.glob(File.expand_path("../detectors/*.rb", __FILE__)) do |file|
  require file
end
