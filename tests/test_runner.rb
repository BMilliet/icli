require 'minitest/autorun'

require_relative '../icli/lib/icli'

Dir["#{__dir__}/mocks/*.rb"].each { |f| require_relative f }
Dir["#{__dir__}/test_cases/*.rb"].each { |f| require_relative f }
