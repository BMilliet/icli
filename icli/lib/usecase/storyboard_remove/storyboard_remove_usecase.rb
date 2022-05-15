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
      target_path = proj.targets.first

      files_map = {
        @main => "#{target_path}/#{@main}",
        @scene => "#{target_path}/#{@scene}",
        @plist => "#{target_path}/#{@plist}",
        @delegate => "#{target_path}/#{@delegate}"
      }

      # remove_files files_map
      # TODO: wip need to remove storyboard reference from pbx info
      remove_files_from_pbx proj, files_map
      # overwrite_app_delegate files_map
      # overwrite_app_infoplist files_map
    end

    private

    def remove_files(files_map)
      files_to_remove = [files_map[@main], files_map[@scene]]
      @file_helper.rm paths: files_to_remove
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

    def remove_files_from_pbx(proj, files_map)
      get_files_ref(proj, files_map).each { |f| @project.rm_file f }

      @project.save proj
    end

    def get_files_ref(proj, files_map)
      path_prefix = @project.absolute_path(proj)

      [
        @project.file_ref(proj, "#{path_prefix}/#{files_map[@scene]}"),
        @project.file_ref(proj, "#{path_prefix}/#{files_map[@main]}").parent
      ]
    end
  end
end
