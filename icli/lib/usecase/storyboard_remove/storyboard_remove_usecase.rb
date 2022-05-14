# frozen_string_literal: true

module ICLI
  # Removes storyboard structure from Xcode new project scaffold.
  # It will remove some files, modifies info.plist and pbx.
  class StoryboardRemoveUsecase
    def initialize
      @ui = ServiceLocator.resolve UI
      @project = ServiceLocator.resolve Project
      @resources = ServiceLocator.resolve Resources
      @file_helper = ServiceLocator.resolve FileHelper

      @main = 'Base.lproj/Main.storyboard'
      @scene = 'SceneDelegate.swift'
      @plist = 'Info.plist'
      @delegate = 'AppDelegate.swift'
    end

    def run
      proj = @project.open('.')
      project_path = proj.targets.first

      files_map = {
        @main => "#{project_path}/#{@main}",
        @scene => "#{project_path}/#{@scene}",
        @plist => "#{project_path}/#{@plist}",
        @delegate => "#{project_path}/#{@delegate}"
      }

      remove_files files_map
      overwrite_app_delegate files_map
      overwrite_app_infoplist files_map
    end

    private

    def remove_files(files_map)
      files_to_remove = [files_map[@main], files_map[@scene]]

      @file_helper.rm paths: files_to_remove
      # TODO: remove from pbx
    end

    def overwrite_app_delegate(files_map)
      @file_helper.cp from: @resources.app_delegate, to: files_map[@delegate]
    end

    def overwrite_app_infoplist(files_map)
      @file_helper.cp from: @resources.infoplist, to: files_map[@plist]
    end

    def find_files_in_project
      @file_helper.find_files '.', @files_to_remove
    end
  end
end
