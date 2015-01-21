require 'simplecov'
SimpleCov.start do
  add_filter "/features/"
end

ENV["TEST"] = "true"
ENV["AUTOLOAD_SPROCKETS"] = "false"

require 'coveralls'
Coveralls.wear!

PROJECT_ROOT_PATH = File.dirname(File.dirname(File.dirname(__FILE__)))
require "middleman-core"
require "middleman-core/step_definitions"
require File.join(PROJECT_ROOT_PATH, 'lib', 'middleman-patterns')
