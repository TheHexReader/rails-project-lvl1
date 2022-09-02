# frozen_string_literal: true

module HexletCode
  module Inputs
    # For rendering submit input
    class SubmitInput
      def self.render(item)
        out = []

        args_for_tag_builder = {
          name: 'commit',
          type: 'submit',
          **item.except(:input_type, :attr_value, :tag_name)
        }

        out << HexletCode::Tag.build('input', **args_for_tag_builder)
      end
    end
  end
end
