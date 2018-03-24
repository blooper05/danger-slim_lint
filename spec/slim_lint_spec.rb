require File.expand_path('spec_helper', __dir__)

module Danger
  describe Danger::DangerSlimLint do
    it 'should be a plugin' do
      expect(Danger::DangerSlimLint.new(nil)).to be_a Danger::Plugin
    end

    describe 'with Dangerfile' do
      let(:dangerfile) { testing_dangerfile }
      let(:slim_lint)  { dangerfile.slim_lint }

      describe '#lint' do
        subject { slim_lint.lint }

        before { stubbings }
        before { subject }

        let(:changed_files) do
          git = slim_lint.git
          expect(git).to receive(:modified_files).and_return(modified_files)
          expect(git).to receive(:added_files).and_return(added_files)
        end

        let(:status_reports)    { dangerfile.status_report[:warnings] }
        let(:violation_reports) { dangerfile.violation_report[:warnings] }

        context 'with changed files' do
          let(:modified_files) { %w(spec/fixtures/modified_file.slim) }
          let(:added_files)    { %w(spec/fixtures/added_file.slim) }

          context 'with lint errors' do
            let(:stubbings) { changed_files && lint_errors }

            let(:lint_errors) do
              linter = ::SlimLint::Report
              errors = [double('Lint Errors', message:  error_message,
                                              filename: filename,
                                              line:     line)]
              expect_any_instance_of(linter).to receive(:lints)
                .and_return(errors)
            end

            let(:error_message) { 'error message' }
            let(:filename)      { "#{Dir.pwd}/path/to/file" }
            let(:line)          { 123 }

            it 'returns warning reports' do
              violation = Violation.new(error_message, false, 'path/to/file', 123)
              expect(status_reports).to eq([error_message])
              expect(violation_reports).to eq([violation])
            end
          end

          context 'with no lint errors' do
            let(:stubbings) { changed_files }

            it 'returns no warning reports' do
              expect(status_reports).to be_empty
              expect(violation_reports).to be_empty
            end
          end
        end

        context 'with no changed files' do
          let(:stubbings)      { changed_files }
          let(:modified_files) { [] }
          let(:added_files)    { [] }

          it 'returns no warning reports' do
            expect(status_reports).to be_empty
            expect(violation_reports).to be_empty
          end
        end
      end
    end
  end
end
