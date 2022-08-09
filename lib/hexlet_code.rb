# frozen_string_literal: true

require_relative 'hexlet_code/version'

# HexletCode module
module HexletCode
  # Tag building
  module Tag
    def self.build(tag, **attr)
      out = "<#{tag}#{attr.empty? ? '' : " #{(attr.map { |key, item| "#{key}=\"#{item}\"" }).join(' ')}"}>"
      unless %w[br img input].include? tag
        tag_inner_text = yield if block_given?
        out = "#{out}#{tag_inner_text}</#{tag}>"
      end
      out
    end
  end

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
      @out << "  <input class=\"user-input\" name=\"#{name}\" type=\"text\"#{
        @struct[name].nil? ? '' : " value=\"#{@struct[name]}\""}>"
    elsif args[:as] == :text
      @out << "  <label for=\"#{name}\">#{name.to_s.capitalize}</label>"
      @out << "  <textarea cols=\"50\" rows=\"50\" name=\"#{name}\">#{@struct[name]}</textarea>"
    end
  end

  def self.submit(*value)
    @out << "  <input name=\"commit\" type=\"submit\" value=\"#{value[0].nil? ? 'Save' : value[0]}\">"
  end
end
