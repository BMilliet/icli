# frozen_string_literal: true

module ICLI
  class StoryboardRemoveUsecaseTests < Minitest::Test
    def setup
      ServiceLocator.clear
      ServiceLocator.register_literal('UI', UIMock)
      ServiceLocator.register_literal('Project', ProjectMock)
      ServiceLocator.register_literal('Resources', Resources)
      ServiceLocator.register_literal('FileHelper', FileHelperMock)
    end

    def test_remove_storyboard_from_project_scaffold
      @ui = ServiceLocator.resolve UI
      @project = ServiceLocator.resolve Project
      @resources = ServiceLocator.resolve Resources
      @file_helper = ServiceLocator.resolve FileHelper

      mock_project = ProjectModelMock.new(targets: ['MockProject', 'MockProjectTests'])
      project_path = mock_project.targets.first

      @project.project_to_open['.'] = mock_project

      StoryboardRemoveUsecase.new.run

      correct_cp = @file_helper.cps == {
        @resources.infoplist => "#{project_path}/Info.plist",
        @resources.app_delegate => "#{project_path}/AppDelegate.swift"
      }

      correct_file_rms = @file_helper.rms == {
        "#{project_path}/Base.lproj/Main.storyboard" => false,
        "#{project_path}/SceneDelegate.swift" => false
      }

      assert correct_cp
      assert correct_file_rms
    end
  end
end
