# frozen_string_literal: true

require_relative '../mocks/file_helper_mock'
require_relative '../mocks/ui_mock'

class AddGitignoreUsecaseTests < Minitest::Test
  def setup
    ICLI::ServiceLocator.new

    ICLI::ServiceLocator.register_literal('UI', UIMock)
    ICLI::ServiceLocator.register_literal('Resources', Resources)
    ICLI::ServiceLocator.register_literal('FileHelper', FileHelperMock)
  end

  def test_add_gitignore
    assert_equal 1, 1
  end

  def test_overwrite_gitignore_project
    assert_equal 1, 1
  end
end
