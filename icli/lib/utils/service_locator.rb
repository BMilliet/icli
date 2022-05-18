# frozen_string_literal: true

module ICLI
  # ServiceLocator should handle common classes.
  # This should avoid unnecessary class inits.
  class ServiceLocator
    @instances = {}

    def initialize
      @instances = {}
    end

    def self.resolve(type)
      target = class_name(type)
      found = @instances[target]
      found.nil? ? error(target) : found
    end

    def self.register(obj)
      obj = obj.new
      key = obj.class.name.split('::').last
      @instances[key] = obj
    end

    # This method should only be used in tests
    def self.register_literal(key, obj)
      @instances[key] = obj.new
    end

    def self.class_name(obj)
      obj.to_s.split('::').last
    end

    def self.error(name)
      UI.new.error "Could not resolve class #{name}"
    end

    def self.clear
      @instances = {}
    end
  end
end