# frozen_string_literal: true

require 'xcodeproj'

module ICLI
  # This class is mostrly a Xcodeproj gem wrapper
  class Project
    def initialize
      @ui = ServiceLocator.resolve UI
    end

    def open(path)
      proj = find_xcodeproj path
      Xcodeproj::Project.open(proj)
    end

    def save(proj)
      proj.save
    end

    def absolute_path(proj)
      # TODO: improve this path handle
      path = proj.path.to_s.split '/'
      path.pop
      path.join '/'
    end

    def targets(proj)
      proj.targets
    end

    def target_groups(target)
      target.groups
    end

    def target_files(target)
      target.source_build_phase.files.to_a.map { |pbx| pbx.file_ref.real_path.to_s }
            .select { |path| path.end_with?('.m', '.mm', '.swift', '.storyboard') }
            .select { |path| File.exist?(path) }
    end

    def group_groups(group)
      group.groups
    end

    def group_files(group)
      group.files
    end

    def find_by_path(group, path)
      group.find_file_by_path(path)
    end

    def file_ref(project, path)
      project.reference_for_path(path)
    end

    def rm_group(group)
      group.clean
    end

    def rm_file(file_ref)
      file_ref.remove_from_project
    end

    def find_xcodeproj(path)
      projects = Dir["#{path}/*.xcodeproj"]

      @ui.error("Could not find xcodeproj at path => #{path}") if projects.count.zero?

      projects.first
    end
  end
end
