# frozen_string_literal: true

class FileHelperMock
  def initialize
    @cps = []
    @find_files = []
  end

  def cp(from:, to:)
    @cps << { from: from, to: to }
    FileUtils.cp from, to, verbose: true
  end

  def exists?(path)
    # todo
    false
  end

  def find_files(path, names)
    @find_files << { path: path, names: names }
  end
end
