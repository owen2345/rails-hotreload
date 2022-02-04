# frozen_string_literal: true

require_relative 'lib/hotreload/version'

Gem::Specification.new do |spec|
  spec.name        = 'hotreload'
  spec.version     = Hotreload::VERSION
  spec.authors     = ['Owen Peredo Diaz']
  spec.email       = ['owenperedo@gmail.com']
  spec.homepage    = 'https://github.com/owen2345/rails-hotreload'
  spec.summary     = 'Auto reloads Rails 7+ applications when assets or views have changed'
  spec.description = 'Auto reloads Rails 7+ applications when assets or views have changed'

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.add_dependency 'listen' # TODO: require false
  spec.add_dependency 'rails'
  spec.add_dependency 'turbo-rails'
end
