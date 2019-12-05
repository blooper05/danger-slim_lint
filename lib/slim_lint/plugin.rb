# frozen_string_literal: true

require 'slim_lint'

module Danger
  # Lints Slim files via [slim-lint](https://rubygems.org/gems/slim_lint).
  # Results are sent as inline comments.
  #
  # @example Running slim-lint
  #
  #          # Runs slim-lint on modified and added files in the PR
  #          slim_lint.lint
  #
  # @see  blooper05/danger-slim_lint
  # @tags slim, ruby, slim-lint, lint
  class DangerSlimLint < Plugin
    # Runs Slim files through slim-lint.
    # @return [Array<SlimLint::Lint, nil>]
    def lint
      files_to_lint = fetch_files_to_lint
      lint_errors   = run_linter(files_to_lint)
      warn_each_line(lint_errors)
    end

    private

    def run_linter(files_to_lint)
      runner = ::SlimLint::Runner.new
      runner.run(files: files_to_lint).lints
    end

    def fetch_files_to_lint
      files = git.modified_files + git.added_files
      files.select do |file|
        ::SlimLint::FileFinder::VALID_EXTENSIONS.include?(File.extname(file))
      end
    end

    def warn_each_line(lint_errors)
      current_dir = "#{Dir.pwd}/"
      lint_errors.each do |error|
        message = error.message
        file    = error.filename.sub(current_dir, '')
        line    = error.line
        warn(message, file: file, line: line)
      end
    end
  end
end
