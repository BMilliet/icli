# frozen_string_literal: true

# Mock version of UI class
class UIMock
  attr_accessor :echos, :error_msm

  def initialize
    clear
  end

  def echo(msg, color = nil)
    @echos[msg] = color
  end

  def error(msg)
    @error_msg = msg
  end

  def clear
    @error_msg = nil
    @echos = {}
  end
end
