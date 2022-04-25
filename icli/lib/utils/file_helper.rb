# frozen_string_literal: true

require 'fileutils'
require 'find'

module ICLI
  # FileUtils and File wrapper.
  class FileHelper
    def cp(from:, to:)
      FileUtils.cp from, to, verbose: true
    end

    def exists?(path)
      File.exist? path
    end

    def find_files(path, names)
      Find.find(path).select { |p| puts p }
      Find.find(path).select { |p| names.any? { |n| n.end_with? p } }
    end
  end
end
