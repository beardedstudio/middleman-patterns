# encoding: utf-8

require 'middleman-core'
require 'middleman-patterns/helpers'

# Middleman extension class.
# Allows overriding default patterns' directory.
# Exposes helper methods in helpers.rb to templates in the middleman app.
# Ignores the patterns directory when building the site by default.
#
# Options:
#    :patterns_directory
#      the local directory patterns are stored in, defaults to "patterns"
#
#    :build_patterns
#      whether or not to ignore the patterns directory when building the site
#
# @see Middleman::Patterns::Helpers
class PatternsExtension < ::Middleman::Extension
  option :patterns_directory, 'patterns', 'The location of the patterns\' directory'
  option :build_patterns, false, 'Whether or not to build pages for patterns.'

  self.defined_helpers = [Middleman::Patterns::Helpers]

  def initialize(app, options_hash = {}, &block)
    super

    app.set :patterns_directory, options.patterns_directory
  end

  # Handles ignoring the patterns directory during build if this appropriate option is set.
  def after_configuration
    @app.ignore(/#{app.config.setting(:patterns_directory).value}\//) unless options.build_patterns
  end
end

PatternsExtension.register(:patterns)
