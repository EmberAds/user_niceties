# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "user_niceties/version"

Gem::Specification.new do |s|
  s.name        = "user_niceties"
  s.version     = UserNiceties::VERSION
  s.authors     = ["EmberAds"]
  s.email       = ["emby@emberads.com"]
  s.homepage    = ""
  s.summary     = "Some simple stuff for making dealing with users a bit easier"
  s.description = "Some simple stuff for making dealing with users a bit easier - especially when you are using Resque"

  s.rubyforge_project = "user_niceties"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency 'rspec'
  s.add_development_dependency "mock_redis"
  s.add_development_dependency "resque_spec"
  s.add_runtime_dependency 'redis'
  s.add_runtime_dependency 'resque'
  s.add_runtime_dependency 'json'
  s.add_runtime_dependency 'railties', [">= 3.0"]
end
