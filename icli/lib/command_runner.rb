require 'thor'

module ICLI
  # Main entry point for commands
  # This class is a command parser wrapper that only register each command.
  class CommandRunner < Thor
    desc 'add_gitignore', 'add swift gitignore to project'
    def add_gitignore
      AddGitignoreCommand.new.run
    end

    desc 'storyboard_remove', 'remove storyboard for Xcode initial setup'
    def storyboard_remove
      StoryboardRemoveCommand.new.run
    end
  end
end
