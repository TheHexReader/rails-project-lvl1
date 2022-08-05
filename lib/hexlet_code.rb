# frozen_string_literal: true

autoload(:Tag, './lib/hexlet_code/tag.rb')
require_relative 'hexlet_code/version'
require_relative 'hexlet_code/tag'

# HexletCode module
module HexletCode
  def self.form_for(item, **args)
    @struct = item
    @out = []
    @out << "<form action=\"#{args[:url].nil? ? '#' : args[:url]}\" method=\"post\">"

    yield(HexletCode)

    @out << '</form>'
    @out * "\n"
  end

  def self.input(name, **args)
    if args[:as].nil?
      @out << "  <label for=\"#{name}\">#{name.to_s.capitalize}</label>"
      @out << "  <input name=\"#{name}\" type=\"text\"#{@struct[name].nil? ? '' : " value=\"#{@struct[name]}\""}>"
    elsif args[:as] == :text
      @out << "  <label for=\"#{name}\">#{name.to_s.capitalize}</label>"
      @out << "  <textarea cols=\"20\" rows=\"40\" name=\"#{name}\">#{@struct[name]}</textarea>"
    end
  end

  def self.submit
    @out << '  <input name="commit" type="submit" value="Save">'
  end
end
