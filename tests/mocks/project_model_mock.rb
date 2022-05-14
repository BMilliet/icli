# frozen_string_literal: true

class ProjectModelMock
  attr_accessor :targets

  def initialize(targets:)
    @targets = targets
  end
end
