# frozen_string_literal: true

require 'fileutils'

module ICLI
  # FileUtils and File wrapper.
  class FileHelper
    def initialize
      @ignored = ['xcuserdata', 'xcsharedata', '.git']
    end

    def cp(from:, to:)
      FileUtils.cp from, to, verbose: true
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
