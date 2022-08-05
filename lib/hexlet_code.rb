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
    @struct_class = item
    @out = []
    @out << "<form action=\"#{args[:url].nil? ? '#' : args[:url]}\" method=\"post\">"

    yield(HexletCode)

    @out << '</form>'
    @out * "\n"
  end

  def self.input(name, **args)
    if args[:as].nil?
      @out << "  <input name=\"#{name}\" type=\"text\" value=\"#{@struct_class[name]}\">"
    elsif args[:as] == :text
      @out << "  <textarea cols=\"20\" rows=\"40\" name=\"#{name}\">#{@struct_class[name]}</textarea>"
    end
  end
end
