# frozen_string_literal: true

# ICLI main module initialization
# Uses autoload to lazy init required classes
module ICLI
  relative = __dir__
  usecases = "#{relative}/usecase"
  utils    = "#{relative}/utils"

  # usecases
  autoload :AddGitignoreUsecase,     "#{usecases}/add_gitignore/add_gitignore_usecase"
  autoload :StoryboardRemoveUsecase, "#{usecases}/storyboard_remove/storyboard_remove_usecase"

  # utils
  autoload :UI,             "#{utils}/ui"
  autoload :Project,        "#{utils}/project"
  autoload :Resources,      "#{utils}/resources"
  autoload :FileHelper,     "#{utils}/file_helper"
  autoload :ServiceLocator, "#{utils}/service_locator"

  # initialize service locator
  ServiceLocator.new
  # inject common classes
  ServiceLocator.register(UI)
  ServiceLocator.register(Project)
  ServiceLocator.register(Resources)
  ServiceLocator.register(FileHelper)
end
