# frozen_string_literal: true

require 'bundler/setup'
Bundler.require

require 'minitest/autorun'

# Test case
class TestCase < MiniTest::Test
  def self.load_fixture(filename)
    File.read(File.dirname(__FILE__) + "/fixtures/#{filename}")
  end
end
