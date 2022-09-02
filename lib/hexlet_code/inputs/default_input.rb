# frozen_string_literal: true

module HexletCode
  module Inputs
    # For rendering default input
    class DefaultInput
      def self.render(item)
        out = []

        args_for_tag_builder = {
          name: item[:tag_name],
          type: 'text',
          **item.except(:input_type, :attr_value, :tag_name)
        }

        args_for_tag_builder[:value] = item[:attr_value] unless item[:attr_value].nil?

        out << HexletCode::Tag.build('label', for: item[:tag_name]) { item[:tag_name].to_s.capitalize }
        out << HexletCode::Tag.build('input', **args_for_tag_builder)
      end
    end
  end
end
