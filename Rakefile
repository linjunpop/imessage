# Skip these tasks when being installed by Homebrew
unless ENV['HOMEBREW_BREW_FILE']
  require "bundler/gem_tasks"
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:spec)

  task :default => :spec
end

namespace :standalone do
  desc "Build standalone version of imessage"
  task :build do
    mkdir_p "build"
    File.open("build/imessage", "w") do |f|
      f.puts "#!/usr/bin/env ruby"
      f.puts "# This file is generated from https://github.com/linjunpop/imessage using `rake standalone:build`"
      f.puts "# any changes will be overwritten."

      f.puts File.read("lib/imessage.rb").gsub(/^require_relative.*\n/, '')
      f.puts File.read("lib/imessage/version.rb")
      f.puts File.read("lib/imessage/parser.rb")
      f.puts File.read("lib/imessage/sender.rb")

      f.puts File.read("exe/imessage")
        .gsub(/^require_relative.*\n/, '')
        .gsub(%r{#!/usr/bin/env ruby}, '')
    end
    sh 'chmod +x build/imessage'
  end

  desc "Install standalone script"
  task :install => :build do
    prefix = ENV['PREFIX'] || ENV['prefix'] || '/usr/local'

    FileUtils.mkdir_p "#{prefix}/bin"
    FileUtils.cp "build/imessage", "#{prefix}/bin"
  end
end
