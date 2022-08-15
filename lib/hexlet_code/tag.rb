# frozen_string_literal: true

module HexletCode
  # Tag building
  module Tag
    def self.build(tag, **attrs)
      single_tags = %w[br img input]
      result = "<#{tag}#{attrs_build(attrs)}>"

      return result if single_tags.include? tag

      inner_text = yield if block_given?
      "#{result}#{inner_text}</#{tag}>"
    end

    def self.attrs_build(attrs)
      return '' if attrs.empty?

      " #{(attrs.map { |key, item| "#{key}=\"#{item}\"" }).join(' ')}"
    end
  end
end
