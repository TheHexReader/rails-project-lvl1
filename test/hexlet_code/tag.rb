# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../lib/hexlet_code'

# Test Hexlet_code
class HexletCodeTest < Minitest::Test
  def test_tag_build
    assert_equal HexletCode::Tag.build('br'), '<br>'
    assert_equal HexletCode::Tag.build('img', src: 'path/to/image'), '<img src="path/to/image">'
    assert_equal HexletCode::Tag.build('input', type: 'submit', value: 'Save'), '<input type="submit" value="Save">'
    assert_equal HexletCode::Tag.build('label') { 'Email' }, '<label>Email</label>'
    assert_equal HexletCode::Tag.build('label', for: 'email') { 'Email' }, '<label for="email">Email</label>'
    assert_equal HexletCode::Tag.build('div'), '<div></div>'
  end
end

test_methods = HexletCodeTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'HexletCode has not tests!' if test_methods.empty?
