# frozen_string_literal: true

require_relative 'hexlet_code/version'

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
end
