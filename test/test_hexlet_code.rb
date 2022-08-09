# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/hexlet_code'

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

  def test_form_for
    user_struct = Struct.new(:name, :job, keyword_init: true)
    user = user_struct.new name: 'rob'

    assert_equal (HexletCode.form_for user do |f|
                  end), "<form action=\"#\" method=\"post\">\n</form>"
    assert_equal (HexletCode.form_for user, url: '/users' do |f|
                  end), "<form action=\"/users\" method=\"post\">\n</form>"
  end

  def test_form_for_input
    user_struct = Struct.new(:name, :job, :gender, keyword_init: true)
    user = user_struct.new name: 'rob', job: 'hexlet', gender: 'm'

    assert_equal (HexletCode.form_for user do |f|
                    f.input :name
                    f.input :job, as: :text
                  end), "<form action=\"#\" method=\"post\">\n  <label for=\"name\">Name</label>
  <input class=\"user-input\" name=\"name\" type=\"text\" value=\"rob\">\n  <label for=\"job\">Job</label>
  <textarea cols=\"50\" rows=\"50\" name=\"job\">hexlet</textarea>
</form>"
  end

  def test_form_for_submit
    user_struct = Struct.new(:name, :job, keyword_init: true)
    user = user_struct.new job: 'hexlet'

    assert_equal (HexletCode.form_for user do |f|
      f.input :name
      f.input :job
      f.submit
    end), "<form action=\"#\" method=\"post\">\n  <label for=\"name\">Name</label>
  <input class=\"user-input\" name=\"name\" type=\"text\">\n  <label for=\"job\">Job</label>
  <input class=\"user-input\" name=\"job\" type=\"text\" value=\"hexlet\">
  <input name=\"commit\" type=\"submit\" value=\"Save\">\n</form>"
  end
end

test_methods = HexletCodeTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
