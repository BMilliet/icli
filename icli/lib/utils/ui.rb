# frozen_string_literal: true

module ICLI
  # UI handles prints and visual feedbacks
  class UI
    def echo(msg, color = nil)
      puts colorize(msg, color)
    end

    def error(msg)
      echo msg, 'red'
      exit(1)
    end

    private

    def colorize(str, color)
      case color
      when 'red'
        "\e[31m#{str}\e[0m"
      when 'green'
        "\e[32m#{str}\e[0m"
      when 'yellow'
        "\e[33m#{str}\e[0m"
      when 'blue'
        "\e[34m#{str}\e[0m"
      when 'cyan'
        "\e[36m#{str}\e[0m"
      else
        str
      end
    end
  end
end
