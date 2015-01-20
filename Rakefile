# encoding: utf-8

require 'bundler'
Bundler::GemHelper.install_tasks

require 'cucumber/rake/task'

require 'middleman-core'

Cucumber::Rake::Task.new(:cucumber, 'Run features that should pass') do |t|
  t.cucumber_opts = "--color --tags ~@wip --strict --format #{ENV['CUCUMBER_FORMAT'] || 'Fivemat'}"
end

require 'rake/clean'

desc 'Run Cucumber tests'
task test: ['cucumber']

task default: :test
