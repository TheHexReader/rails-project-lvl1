# frozen_string_literal: true

# Module HexletCode
module HexletCode
  # Form Builder class
  class FormBuilder
    attr_writer :entity
    attr_accessor :result

    def initialize(item, result)
      @entity = item
      @result = result
    end

    def input(name, **args)
      get_attr_value = @entity.public_send(name)
      if args[:as].nil?
        process_input_as_input(name, get_attr_value, args.except(:as))
      elsif args[:as] == :text
        process_input_as_text(name, get_attr_value, args.except(:as))
      end
    end

    def submit(tag_value = 'Save', **args)
      args_for_submit_build = { name: 'commit', type: 'submit', value: tag_value, **args }
      @result << { has_label: false, tag: 'input', attrs: args_for_submit_build, inner: nil }
    end

    def process_input_as_input(tag_name, get_attr_value, args)
      args_for_input_build = { name: tag_name, type: 'text', **args }
      args_for_input_build[:value] = get_attr_value unless get_attr_value.nil?
      @result << { has_label: true, tag: 'input', attrs: args_for_input_build, inner: nil }
    end

    def process_input_as_text(tag_name, get_attr_value, args)
      args_for_text_build = { name: tag_name, **args }
      args_for_text_build[:cols] ||= '50'
      args_for_text_build[:rows] ||= '50'
      @result << { has_label: true, tag: 'textarea', attrs: args_for_text_build, inner: get_attr_value }
    end
  end
end
