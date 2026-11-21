# CMU Web Style

CMU Web Style is a gem of shared RuboCop and erb_lint settings for Rails
apps built with CMU Web: Rails' own style (rubocop-rails-omakase, which new
Rails apps start with), the files no app lints, and erb_lint settings that
work with it.

## Use It

Add the gem to the app's Gemfile. It brings rubocop-rails-omakase and
erb_lint with it:

```ruby
gem "cmu-web-style", require: false, group: :development
```

Point the app's `.rubocop.yml` at the shared settings, then add the app's
own rules under them:

```yaml
inherit_gem:
  cmu-web-style: config/rubocop.yml
```

And its `.erb_lint.yml`:

```yaml
inherit_gem:
  cmu-web-style: config/erb_lint.yml
```

Check with `bin/rubocop` and `bundle exec erb_lint --lint-all`. The
Carnegie Mellon Web Kilt's template for new Rails apps sets all of this up.

## Work on It

```console
bundle install
bundle exec rake
```

The tests load both files and check that RuboCop and erb_lint accept them.
Versions use semantic versioning as plain numbers (e.g., `0.1.0`), set in
`cmu-web-style.gemspec`; the release tag matches it.
