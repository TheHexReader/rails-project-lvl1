# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/hexlet_code'

# Test Hexlet_code
class HexletCodeTest < Minitest::Test
  def test_form_for
    user_struct = Struct.new(:name, :job, keyword_init: true)
    user = user_struct.new name: 'rob'

    result1 = HexletCode.form_for user do |f|
      f
    end
    result2 = HexletCode.form_for user, url: '/users' do |f|
      f
    end

    assert_equal result1, "<form action=\"#\" method=\"post\">\n</form>"
    assert_equal result2, "<form action=\"/users\" method=\"post\">\n</form>"
  end

  def test_form_for_input
    user_struct = Struct.new(:name, :job, :gender, keyword_init: true)
    user = user_struct.new name: 'rob', job: 'hexlet', gender: 'm'

    result = HexletCode.form_for user do |f|
      f.input :name
      f.input :job, as: :text
    end

    expected = File.open('./test/fixtures/hexlet_code_1.txt').read

    assert_equal result, expected
  end

  def test_form_for_submit
    user_struct = Struct.new(:name, :job, keyword_init: true)
    user = user_struct.new job: 'hexlet'

    result = HexletCode.form_for user do |f|
      f.input :name
      f.input :job
      f.submit
    end

    expected = File.open('./test/fixtures/hexlet_code_2.txt').read

    assert_equal result, expected
  end
end

test_methods = HexletCodeTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'HexletCode has not tests!' if test_methods.empty?
