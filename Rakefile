require "rake"

$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "clouseau/version"

task :default => "spec"

desc "Run specs"
task "spec" => ["bundler:install", "test:spec"]

task :build do
  sh "gem build clouseau.gemspec"
end

task :install => :build do
  sh "gem install --local clouseau-#{Clouseau::VERSION}"
end

task :uninstall do
  sh "gem uninstall clouseau"
end

task :reinstall => [:uninstall, :install]

task :release => :build do
  sh "gem push clouseau-#{Clouseau::VERSION}.gem"
end

namespace "bundler" do
  desc "Install gems"
  task "install" do
    sh("bundle install")
  end
end

namespace "test" do
  task "spec" do |t|
    sh("cd spec && bundle exec rake spec")
  end
end

