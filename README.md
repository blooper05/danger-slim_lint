# danger-slim_lint

[![Build Status](https://img.shields.io/travis/blooper05/danger-slim_lint.svg?longCache=true&style=flat)](https://travis-ci.org/blooper05/danger-slim_lint)
[![Dependency Status](https://img.shields.io/gemnasium/blooper05/danger-slim_lint.svg?longCache=true&style=flat)](https://gemnasium.com/blooper05/danger-slim_lint)
[![Code Climate](https://img.shields.io/codeclimate/maintainability/blooper05/danger-slim_lint.svg?longCache=true&style=flat)](https://codeclimate.com/github/blooper05/danger-slim_lint)
[![Coverage](https://img.shields.io/codeclimate/c/blooper05/danger-slim_lint.svg?longCache=true&style=flat)](https://codeclimate.com/github/blooper05/danger-slim_lint)
[![Gem Version](https://img.shields.io/gem/v/danger-slim_lint.svg?longCache=true&style=flat)](https://rubygems.org/gems/danger-slim_lint)
[![License](https://img.shields.io/github/license/blooper05/danger-slim_lint.svg?longCache=true&style=flat)](https://github.com/blooper05/danger-slim_lint/blob/master/LICENSE)

A description of danger-slim_lint.

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
