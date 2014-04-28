$:.push File.expand_path('../lib', __FILE__)

require 'spotify/charts/version'

Gem::Specification.new do |spec|
  spec.platform      = Gem::Platform::RUBY
  spec.name          = 'spotify-charts'
  spec.version       = Spotify::Charts::VERSION
  spec.summary       = %q{Ruby wrapper for the Spotify Charts API}
  spec.description   = %q{Ruby wrapper for the Spotify Charts API}

  spec.license       = 'MIT'

  spec.authors       = ['Falk Koeppe']
  spec.email         = ['falk.koeppe@gmail.com']
  spec.homepage      = 'http://github.com/murphyslaw/spotify-charts'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = []
  spec.test_files    = Dir['spec/**/*']
  spec.files         = Dir[
    'lib/**/*',
    'LICENSE',
    'README.md',
    'CHANGELOG.md',
  ]

  spec.add_dependency 'json'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'autotest'
  spec.add_development_dependency 'simplecov'
end
