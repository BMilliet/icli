# frozen_string_literal: true

module ICLI
  # Resources provider
  class Resources
    def gitignore
      relative 'resources/new_project/gitignore_template.txt'
    end

    def infoplist
      relative 'resources/new_project/infoplist_template.txt'
    end

    def app_delegate
      relative 'resources/new_project/appdelegate_template.txt'
    end

    private

    def relative(path)
      root.gsub 'icli/lib/utils', path
    end

    def root
      __dir__
    end
  end
end
