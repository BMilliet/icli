# frozen_string_literal: true

module ICLI
  # Removes storyboard structure from Xcode new project scaffold.
  # It will remove some files, modifies info.plist and pbx.
  class StoryboardRemoveUsecase
    def initialize
      @project = ServiceLocator.resolve Project
      @file_helper = ServiceLocator.resolve FileHelper
      @resources = ServiceLocator.resolve Resources
      @ui = ServiceLocator.resolve UI
    end

    def run
      puts 'removing storyboard'
      proj = @project.open('.')

      remove_files proj
      overwrite_app_delegate proj
    end

    private

    def remove_files(proj)
      files_to_remove = find_files
      puts files_to_remove
      puts proj.to_s
      # remove sceneDelegate
      # remove main.storyboard
    end

    def overwrite_app_delegate(project)
      # @project.find_file project, 'AppDelegate.swift'
      # target = project.targets.first
      # files = @project.files target
      # puts files

      # @file_helper.cp from: @resources.app_delegate, to: ''
    end

    def find_files
      @file_helper.find_files '.', ['SceneDelegate.swift', 'Main.storyboard']
    end
  end
end
