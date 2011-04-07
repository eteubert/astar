# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "astar/version"

Gem::Specification.new do |s|
  s.name        = "astar"
  s.version     = Astar::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Eric Teubert"]
  s.email       = ["ericteubert@googlemail.com"]
  s.homepage    = ""
  s.summary     = %q{An A* Implementation}
  s.description = %q{An A* algorithm using a priority queue.}

  s.rubyforge_project = "astar"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency("algorithms")
end
