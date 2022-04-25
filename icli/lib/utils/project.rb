# frozen_string_literal: true

require 'xcodeproj'

module ICLI
  # Xcodeproj gem wrapper
  class Project
    def open(path)
      proj = find_xcodeproj path
      Xcodeproj::Project.open(proj)
    end

    def save(proj)
      proj.save
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
      # puts project.groups.first.find_file_by_path('SceneDelegate.swift').real_path.to_s
      group.find_file_by_path(path)
    end

    def rm_group(group)
      group.clean
    end

    def rm_file(file)
      file.remove_from_project
    end

    def find_xcodeproj(path)
      projects = Dir["#{path}/*.xcodeproj"]

      if projects.count.zero?
        puts 'could not find xcodeproj'
        return
      end

      projects.first
    end
  end
end
