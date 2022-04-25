# frozen_string_literal: true

module ICLI
  # StoryboardRemoveUsecase entry point.
  # Dependencies are inject here for now
  class StoryboardRemoveCommand
    def run
      resources = Resources.new
      file_helper = FileHelper.new
      project = Project.new

      StoryboardRemoveUsecase.new(file_helper: file_helper, resources: resources, project: project).run
    end
  end
end
