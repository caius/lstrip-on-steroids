#!/usr/bin/env rake
require "bundler/gem_tasks"

begin
  require "rspec/core/rake_task"
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError => e
  task :spec do
    fail "RSpec didn't load, maybe try with `bundle exec rake spec`?"
  end
end
