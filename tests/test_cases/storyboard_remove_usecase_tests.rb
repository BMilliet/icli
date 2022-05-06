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

    # TODO: test
  end
end
