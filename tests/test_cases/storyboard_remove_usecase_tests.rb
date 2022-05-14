# frozen_string_literal: true

require_relative '../mocks/file_helper_mock'
require_relative '../mocks/project_mock'
require_relative '../mocks/ui_mock'

module ICLI
  class StoryboardRemoveUsecaseTests < Minitest::Test
    def setup
      ServiceLocator.clear
      ServiceLocator.register_literal('UI', UIMock)
      ServiceLocator.register_literal('Project', ProjectMock)
      ServiceLocator.register_literal('Resources', Resources)
      ServiceLocator.register_literal('FileHelper', FileHelperMock)
    end

    def remove_storyboard_from_project_scaffold
      @ui = ServiceLocator.resolve UI
      @project = ServiceLocator.resolve Project
      @resources = ServiceLocator.resolve Resources
      @file_helper = ServiceLocator.resolve FileHelper

      StoryboardRemoveUsecase.new.run

      correct_cp = @file_helper.cps == {
        @main => "#{project_path}/#{@main}",
        @scene => "#{project_path}/#{@scene}"
      }

      assert correct_cp
    end
  end
end
