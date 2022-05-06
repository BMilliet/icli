# frozen_string_literal: true

require_relative '../mocks/file_helper_mock'
require_relative '../mocks/ui_mock'

module ICLI
  class AddGitignoreUsecaseTests < Minitest::Test
    def setup
      ServiceLocator.clear
      ServiceLocator.register_literal('UI', UIMock)
      ServiceLocator.register_literal('Resources', Resources)
      ServiceLocator.register_literal('FileHelper', FileHelperMock)
    end

    def test_add_gitignore_blank_project
      @resources = ServiceLocator.resolve Resources
      @file_helper = ServiceLocator.resolve FileHelper
      @ui = ServiceLocator.resolve UI

      AddGitignoreUsecase.new.run

      correct_cp = @file_helper.cps.first == { from: @resources.gitignore, to: '.gitignore' }
      number_of_operations = @file_helper.cps.length == 1
      no_ignore_registered = @file_helper.existing_paths.empty?
      no_echos = @ui.echos.empty?

      assert correct_cp
      assert number_of_operations
      assert no_ignore_registered
      assert no_echos
    end

    def test_add_gitignore_already_with_ignore
      @resources = ServiceLocator.resolve Resources
      @file_helper = ServiceLocator.resolve FileHelper
      @ui = ServiceLocator.resolve UI

      @file_helper.add_path '.gitignore'

      AddGitignoreUsecase.new.run

      number_of_operations = @file_helper.cps.empty?
      ignore_registered = @file_helper.exists? '.gitignore'
      paths_registered = @file_helper.existing_paths.length == 1
      echos = @ui.echos.length == 1
      msgs = @ui.echos[0] = {
        msg: 'Project already have ignore. You can overwrite it with --force flag', color: 'yellow'
      }

      assert number_of_operations
      assert ignore_registered
      assert paths_registered
      assert msgs
      assert echos
    end

    def test_overwrite_gitignore_project
      @resources = ServiceLocator.resolve Resources
      @file_helper = ServiceLocator.resolve FileHelper
      @ui = ServiceLocator.resolve UI

      @file_helper.add_path '.gitignore'

      AddGitignoreUsecase.new.run(force: true)

      ignore_registered = @file_helper.exists? '.gitignore'
      correct_cp = @file_helper.cps.first == { from: @resources.gitignore, to: '.gitignore' }
      number_of_operations = @file_helper.cps.length == 1
      echos = @ui.echos.length == 1
      msgs = @ui.echos[0] = { msg: 'Overwritting gitignore', color: 'yellow' }

      assert ignore_registered
      assert correct_cp
      assert number_of_operations
      assert msgs
      assert echos
    end
  end
end
