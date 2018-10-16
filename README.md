# danger-slim_lint

[![Build Status](https://badgen.net/travis/blooper05/danger-slim_lint?icon=travis)](https://travis-ci.com/blooper05/danger-slim_lint)
[![Dependency Status](https://api.dependabot.com/badges/status?host=github&repo=blooper05/danger-slim_lint)](https://dependabot.com)
[![Maintainability](https://badgen.net/codeclimate/maintainability/blooper05/danger-slim_lint?icon=codeclimate)](https://codeclimate.com/github/blooper05/danger-slim_lint)
[![Coverage](https://badgen.net/codeclimate/coverage/blooper05/danger-slim_lint?icon=codeclimate)](https://codeclimate.com/github/blooper05/danger-slim_lint)
[![Version](https://badgen.net/rubygems/v/danger-slim_lint?icon=ruby)](https://rubygems.org/gems/danger-slim_lint)
[![License](https://badgen.net/github/license/blooper05/danger-slim_lint?icon=github)](https://github.com/blooper05/danger-slim_lint/blob/master/LICENSE)

A [Danger](https://rubygems.org/gems/danger) plugin for [slim-lint](https://rubygems.org/gems/slim_lint).

## Installation

    $ gem install danger-slim_lint

## Usage

### slim_lint

Lints Slim files via [slim-lint](https://rubygems.org/gems/slim_lint).
Results are sent as inline comments.

<blockquote>Running slim-lint
  <pre>
# Runs slim-lint on modified and added files in the PR
slim_lint.lint</pre>
</blockquote>

#### Methods

`lint` - Runs Slim files through slim-lint.

## Development

1. Clone this repo
2. Run `bundle install` to setup dependencies.
3. Run `bundle exec rake spec` to run the tests.
4. Use `bundle exec guard` to automatically have tests run as you make changes.
5. Make your changes.
