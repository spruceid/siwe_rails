require_relative 'lib/siwe_rails/version'

Gem::Specification.new do |spec|
  spec.name        = 'siwe_rails'
  spec.description = 'Custom Rails Engine to server local pages for SIWE'
  spec.summary = spec.description
  spec.homepage = 'https://github.com/spruceid/siwe-rails-engine'
  spec.version = SiweRails::VERSION
  spec.authors = ['Spruce Systems, Inc.']
  spec.licenses = ['MIT', 'Apache-2.0']

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.add_dependency 'rails', '>= 7.0.1'
  spec.add_dependency 'sass-rails'
  spec.add_dependency 'siwe'
end
