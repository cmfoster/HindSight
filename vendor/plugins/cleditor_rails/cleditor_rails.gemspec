# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "cleditor_rails/version"

Gem::Specification.new do |s|
  s.name        = "cleditor_rails"
  s.version     = CleditorRails::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Sean Behan"]
  s.email       = ["bseanvt@gmail.com"]
  s.homepage    = "https://github.com/bseanvt/cleditor_rails"
  s.summary     = %q{jQuery CLEditor for Rails 3.1 Asset Pipeline}
  s.description = %q{jQuery CLEditor for Rails 3.1 Asset Pipeline}

  s.rubyforge_project = "cleditor_rails"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
