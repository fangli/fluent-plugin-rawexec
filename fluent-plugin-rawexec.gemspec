# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name          = "fluent-plugin-rawexec"
  s.version       = '0.0.1'
  s.authors       = ["FangLi"]
  s.email         = ["surivlee@gmail.com"]
  s.description   = %q{Execute user script with RAW message output plugin for Fluentd}
  s.summary       = %q{Execute user script with RAW message output plugin for Fluentd}
  s.homepage      = "https://github.com/fangli/fluent-plugin-rawexec"
  s.license       = 'MIT'

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_runtime_dependency "fluentd"

  s.add_development_dependency "rake"
  s.add_development_dependency "webmock"
end
