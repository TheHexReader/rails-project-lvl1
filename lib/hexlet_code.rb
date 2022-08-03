# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  module Tag
    def Tag.build(tag, **attr)
      out = "<#{tag}#{attr.nil? ? '' : " #{(attr.map {|key, item| "#{key.to_s}=\"#{item.to_s}\"" }).join(', ')}"}>"
      if !%w[br img input].include? tag
        tag_inner_text = yield
        out = "#{out}#{tag_inner_text}</#{tag}>"
      end
      return out
    end
  end
end
