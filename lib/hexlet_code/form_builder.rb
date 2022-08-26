# frozen_string_literal: true

# Module HexletCode
module HexletCode
  # Form Builder class
  class FormBuilder
    attr_writer :entity
    attr_accessor :result

    # def initialize

    # end

    def input(name, **args)
      public_send_result = @entity.public_send(name)
      @result << { tag: 'label', attrs: { for: name }, inner: name.to_s.capitalize }
      if args[:as].nil?
        process_input_as_input(name, public_send_result, args.except(:as))
      elsif args[:as] == :text
        process_input_as_text(name, public_send_result, args.except(:as))
      end
    end

    def submit(value = nil, **args)
      args_for_submit_build = { name: 'commit', type: 'submit', value: value.nil? ? 'Save' : value, **args }
      @result << { tag: 'input', attrs: args_for_submit_build, inner: nil }
    end

    def process_input_as_input(tag_name, public_send_result, args)
      args_for_input_build = { name: tag_name, type: 'text', **args }
      args_for_input_build[:value] = public_send_result unless public_send_result.nil?
      @result << { tag: 'input', attrs: args_for_input_build, inner: nil }
    end

    def process_input_as_text(tag_name, public_send_result, args)
      args_for_text_build = { name: tag_name, **args }
      args_for_text_build[:cols] ||= '50'
      args_for_text_build[:rows] ||= '50'
      @result << { tag: 'textarea', attrs: args_for_text_build, inner: public_send_result }
    end
  end
end
