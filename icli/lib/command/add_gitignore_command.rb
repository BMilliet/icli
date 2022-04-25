# frozen_string_literal: true

module ICLI
  # AddGitignoreUsecase entry point.
  # Dependencies are inject here for now
  class AddGitignoreCommand
    def run(force: false)
      resources = Resources.new
      file_helper = FileHelper.new

      AddGitignoreUsecase.new(file_helper: file_helper, resources: resources).run(force: force)
    end
  end
end
