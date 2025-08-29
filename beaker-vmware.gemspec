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
  s.license     = 'Apache-2.0'

  s.files         = `git ls-files`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.required_ruby_version = Gem::Requirement.new('>= 3.2')

  # Testing dependencies
  s.add_development_dependency 'fakefs', '~> 2.4'
  s.add_development_dependency 'rake', '~> 13.0', '>= 13.0.6'
  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'rspec-its', '~> 1.3'
  s.add_development_dependency 'voxpupuli-rubocop', '~> 4.2.0'
  # Run time dependencies
  s.add_dependency 'beaker', '>= 4', '< 7'
  s.add_dependency 'fission', '~> 0.4'
  s.add_dependency 'rbvmomi2', '~> 3.7'
  s.add_dependency 'stringify-hash', '~> 0.0.0'
end
