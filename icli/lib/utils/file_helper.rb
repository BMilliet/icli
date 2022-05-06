# frozen_string_literal: true

require 'fileutils'

module ICLI
  # FileUtils and File wrapper.
  class FileHelper
    def initialize
      @ui = ServiceLocator.resolve UI
      @ignored = ['xcuserdata', 'xcsharedata', '.git']
    end

    def cp(from:, to:)
      @ui.echo "cp: #{from} => #{to}", 'blue'
      FileUtils.cp from, to, verbose: false
    end

    def rm(paths:, force: false)
      @ui.echo "rm: #{paths}", 'yellow'
      FileUtils.rm paths, force: force
    end

    def exists?(path)
      File.exist? path
    end

    def find_files(path, names)
      Dir.glob("#{path}/**/*")
         .reject { |f| @ignored.any? { |i| f.include? i } }
         .select { |f| names.any? { |i| f.end_with? i } }
    end
  end
end
