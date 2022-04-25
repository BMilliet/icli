# frozen_string_literal: true

require 'fileutils'

module ICLI
  # FileUtils and File wrapper.
  class FileHelper
    def cp(from:, to:)
      FileUtils.cp from, to, verbose: true
    end

    def exists?(path)
      File.exist? path
    end
  end
end
