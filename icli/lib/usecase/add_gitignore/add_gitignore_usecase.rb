# frozen_string_literal: true

module ICLI
  # Add basic gitignore for new xcodeproject and swift.
  # This file will be placed if no ignore is found or overwritten if force paramenter is true.
  # It will alocate a internal copy example from inside resources.
  class AddGitignoreUsecase
    def initialize
      @ui = ServiceLocator.resolve UI
      @resources = ServiceLocator.resolve Resources
      @file_helper = ServiceLocator.resolve FileHelper
    end

    def run(force: false)
      @ignore = '.gitignore'
      force ? overwrite : create
    end

    private

    def overwrite
      @ui.echo('Overwritting gitignore', 'yellow') if gitignore?
      @file_helper.cp from: @resources.gitignore, to: @ignore
    end

    def create
      if gitignore?
        @ui.echo 'Project already have ignore. You can overwrite it with --force flag', 'yellow'
        return
      end

      overwrite
    end

    def gitignore?
      @file_helper.exists? @ignore
    end
  end
end
