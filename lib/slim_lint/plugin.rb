require 'slim_lint'

module Danger
  # This is your plugin class. Any attributes or methods you expose here will
  # be available from within your Dangerfile.
  #
  # To be published on the Danger plugins site, you will need to have
  # the public interface documented. Danger uses [YARD](http://yardoc.org/)
  # for generating documentation from your plugin source, and you can verify
  # by running `danger plugins lint` or `bundle exec rake spec`.
  #
  # You should replace these comments with a public description of your library.
  #
  # @example Ensure people are well warned about merging on Mondays
  #
  #          my_plugin.warn_on_mondays
  #
  # @see  blooper05/danger-slim_lint
  # @tags monday, weekends, time, rattata
  #
  class DangerSlimLint < Plugin
    # A method that you can call from your Dangerfile
    # @return   [Array<String>]
    #
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
