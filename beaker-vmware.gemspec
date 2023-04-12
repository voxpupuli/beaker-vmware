$LOAD_PATH.unshift File.expand_path('lib', __dir__)
require 'beaker-vmware/version'

Gem::Specification.new do |s|
  s.name        = 'beaker-vmware'
  s.version     = BeakerVmware::VERSION
  s.authors     = ['Vox Pupuli']
  s.email       = ['voxpupuli@groups.io']
  s.homepage    = 'https://github.com/voxpupuli/beaker-vmware'
  s.summary     = 'Beaker DSL Extension Helpers!'
  s.description = 'For use for the Beaker acceptance testing tool'
  s.license     = 'Apache2'

  s.files         = `git ls-files`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.required_ruby_version = Gem::Requirement.new('>= 2.7')

  # Testing dependencies
  s.add_development_dependency 'fakefs', '~> 2.4'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'rspec-its'
  s.add_development_dependency 'rubocop', '~> 1.50.1'
  s.add_development_dependency 'rubocop-performance', '~> 1.10'
  s.add_development_dependency 'rubocop-rake', '~> 0.2'
  s.add_development_dependency 'rubocop-rspec', '>= 1.44'
  # Run time dependencies
  s.add_runtime_dependency 'beaker', '>= 4', '< 6'
  s.add_runtime_dependency 'fission', '~> 0.4'
  s.add_runtime_dependency 'rbvmomi', '>= 1.9', '< 4.0'
  s.add_runtime_dependency 'stringify-hash', '~> 0.0.0'
end
