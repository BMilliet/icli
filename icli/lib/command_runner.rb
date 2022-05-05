require 'thor'

# Main entry point for commands
# This class is a command parser wrapper that only register each command.
class CommandRunner < Thor
  desc 'add_gitignore', 'add swift gitignore to project'
  method_options force: :boolean
  def add_gitignore
    ICLI::AddGitignoreUsecase.new.run(force: options.force?)
  end

  desc 'storyboard_remove', 'remove storyboard for Xcode initial setup'
  def storyboard_remove
    ICLI::StoryboardRemoveUsecase.new.run
  end
end
