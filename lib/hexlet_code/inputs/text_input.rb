# frozen_string_literal: true

module HexletCode
  module Inputs
    # For rendering text input
    class TextInput
      def self.render(item)
        out = []

        args_for_tag_builder = {
          name: item[:tag_name],
          cols: item.fetch(:cols, '50'),
          rows: item.fetch(:rows, '50'),
          **item.except(:input_type, :attr_value, :tag_name)
        }

        out << HexletCode::Tag.build('label', for: item[:tag_name]) { item[:tag_name].to_s.capitalize }
        out << HexletCode::Tag.build('textarea', **args_for_tag_builder) { item[:attr_value] }
      end
    end
  end
end
