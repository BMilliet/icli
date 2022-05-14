# frozen_string_literal: true

class ProjectMock
  attr_accessor :project_to_open

  def initialize
    clear
  end

  def open(path)
    @project_to_open[path]
  end

  def clear
    @project_to_open = {}
  end
end
