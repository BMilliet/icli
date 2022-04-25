# frozen_string_literal: true

# ICLI main module initialization
# Uses autoload to lazy init required classes
module ICLI
  relative = __dir__
  usecases = "#{relative}/usecase"
  commands = "#{relative}/command"
  utils    = "#{relative}/utils"

  # command
  autoload :CommandRunner,           "#{relative}/command_runner"
  autoload :AddGitignoreCommand,     "#{commands}/add_gitignore_command"
  autoload :StoryboardRemoveCommand, "#{commands}/storyboard_remove_command"

  # usecases
  autoload :AddGitignoreUsecase, "#{usecases}/add_gitignore/add_gitignore_usecase"
  autoload :StoryboardUsecase,   "#{usecases}/storyboard_remove/storyboard_remove_usecase"

  # utils
  autoload :FileHelper, "#{utils}/file_helper"
  autoload :Resources,  "#{utils}/resources"
end
