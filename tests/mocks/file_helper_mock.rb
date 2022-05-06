# frozen_string_literal: true

# Mock version of FileHelper
class FileHelperMock
  attr_accessor :cps, :find_files_list, :existing_paths, :rms

  def initialize
    clear
  end

  def cp(from:, to:)
    @cps << { from: from, to: to }
  end

  def rm(paths:, force: false)
    paths.each { |p| rms << { path: p, force: force } }
  end

  def exists?(path)
    @existing_paths.include? path
  end

  def find_files(path, names)
    @find_files_lits << { path: path, names: names }
  end

  def add_path(path)
    @existing_paths << path
  end

  def clear
    @cps = []
    @find_files_lits = []
    @existing_paths = []
  end
end
