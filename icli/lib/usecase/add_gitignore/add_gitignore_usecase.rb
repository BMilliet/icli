# frozen_string_literal: true

module ICLI
  # Add basic gitignore for new xcodeproject and swift.
  # This file will be placed if no ignore is found or overwritten if force paramenter is true.
  # It will alocate a internal copy example from inside resources.
  class AddGitignoreUsecase
    def initialize(file_helper:, resources:)
      @file_helper = file_helper
      @resources = resources
    end

    def run(force: false)
      puts 'adding git ignore'
      @ignore = '.gitignore'
      force ? overwrite : create
    end

    private

    def overwrite
      @file_helper.cp from: @resources.gitignore, to: @ignore
    end

    def create
      if @file_helper.exists? @ignore
        puts 'Project already have ignore'
        return
      end

      overwrite
    end
  end
end
