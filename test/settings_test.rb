# frozen_string_literal: true

require 'minitest/autorun'
require 'yaml'
require 'tmpdir'
require 'rubocop'
require 'erb_lint/all'

# The two settings files load, and RuboCop and erb_lint accept them
class SettingsTest < Minitest::Test
  CONFIG = File.expand_path('../config', __dir__)

  def test_rubocop_accepts_the_settings
    config = RuboCop::ConfigLoader.load_file(File.join(CONFIG, 'rubocop.yml'))
    # Rails' own style comes through, and the files no app lints are left out
    assert config.for_cop('Style/StringLiterals')['Enabled']
    assert_includes config.for_all_cops['Exclude'].join("\n"), 'db/schema.rb'
  end

  def test_rubocop_lints_a_file_with_the_settings
    Dir.mktmpdir do |directory|
      File.write(File.join(directory, 'clean.rb'), %(puts "Spring Carnival Sweepstakes"\n))
      store = RuboCop::ConfigStore.new
      store.options_config = File.join(CONFIG, 'rubocop.yml')
      runner = RuboCop::Runner.new({ formatters: [['quiet', File::NULL]] }, store)
      assert runner.run([File.join(directory, 'clean.rb')]), 'A clean file has offenses'
    end
  end

  def test_erb_lint_accepts_the_settings
    settings = YAML.safe_load_file(File.join(CONFIG, 'erb_lint.yml'))
    config = ERBLint::RunnerConfig.new(settings)
    assert config.for_linter(ERBLint::Linters::ErbSafety).enabled?
    assert config.for_linter(ERBLint::Linters::Rubocop).enabled?
  end
end
