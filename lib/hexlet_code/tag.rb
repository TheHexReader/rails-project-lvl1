# frozen_string_literal: true

module HexletCode
  # Tag building
  module Tag
    def self.build(tag, **attrs)
      singleton_tags = %w[br img input]
      result = "<#{tag}#{attrs.empty? ? '' : " #{(attrs.map { |key, item| "#{key}=\"#{item}\"" }).join(' ')}"}>"

      return result if singleton_tags.include? tag

      inner_text = yield if block_given?
      "#{result}#{inner_text}</#{tag}>"
    end
  end
end
