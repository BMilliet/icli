# frozen_string_literal: true

# load icli main module
require_relative '../lib/icli'

# load command runner
require_relative '../lib/command_runner'

CommandRunner.start ARGV
