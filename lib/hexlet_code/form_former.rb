# frozen_string_literal: true

# Module HexletCode
module HexletCode
  # FormFormer class
  class FormFormer
    class << self
      attr_writer :entity
      attr_accessor :result
    end

    def self.input(name, **args)
      @entity.public_send(name)
      # @result << HexletCode::Tag.build('label', for: name) { name.to_s.capitalize }
      @result << { tag: 'label', attrs: { for: name }, inner: name.to_s.capitalize }
      if args[:as].nil?
        process_input_as_input(name)
      elsif args[:as] == :text
        process_input_as_text(name)
      end
    end

    def self.submit(value = nil, **_args)
      args_for_submit_build = { name: 'commit', type: 'submit', value: value.nil? ? 'Save' : value }
      # @result << HexletCode::Tag.build('input', **args_for_submit_build)
      @result << { tag: 'input', attrs: args_for_submit_build, inner: nil }
    end

    def self.process_input_as_input(tag_name)
      args_for_input_build = { class: 'user-input', name: tag_name, type: 'text' }
      args_for_input_build[:value] = @entity[tag_name] unless @entity[tag_name].nil?
      # @result << HexletCode::Tag.build('input', **args_for_input_build)
      @result << { tag: 'input', attrs: args_for_input_build, inner: nil }
    end

    def self.process_input_as_text(tag_name)
      # @result << HexletCode::Tag.build('textarea', cols: '50', rows: '50', name: tag_name) { @entity[tag_name] }
      args_for_text_build = { cols: '50', rows: '50', name: tag_name }
      @result << { tag: 'textarea', attrs: args_for_text_build, inner: @entity[tag_name] }
    end
  end
end
