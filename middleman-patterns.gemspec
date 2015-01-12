# encoding: utf-8

$LOAD_PATH.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'middleman-patterns'
  s.version     = '0.1'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Brett Bender']
  s.email       = ['brett@bearded.com']
  s.homepage    = 'http://www.bearded.com'
  s.summary     = 'An implementation of pattern-lab (http://patternlab.io) for middleman'
  s.description = s.summary

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  # The version of middleman-core your extension depends on
  s.add_runtime_dependency('middleman-core', ['>= 3.3.7'])
end
