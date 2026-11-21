# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = 'cmu-web-style'
  spec.version = '0.1.0'
  spec.authors = ['CMU Web']
  spec.summary = 'Shared RuboCop and erb_lint settings for CMU Web Rails apps'
  spec.description = "Rails' own style (rubocop-rails-omakase) plus the files no app lints, and erb_lint " \
                     'settings that work with it, for Rails apps built with CMU Web.'
  spec.homepage = 'https://github.com/cmu-web/cmu-web-style'
  spec.license = 'BSD-3-Clause'
  spec.required_ruby_version = '>= 3.2'

  spec.files = Dir['config/*.yml'] + %w[LICENSE README.md]
  spec.metadata = {
    'source_code_uri' => 'https://github.com/cmu-web/cmu-web-style',
    'bug_tracker_uri' => 'https://github.com/cmu-web/cmu-web-style/issues',
    'rubygems_mfa_required' => 'true'
  }

  # The settings build on these, so an app needs only this gem
  spec.add_dependency 'erb_lint', '>= 0.9'
  spec.add_dependency 'rubocop-rails-omakase', '>= 1.0'
end
