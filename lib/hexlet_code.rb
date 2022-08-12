# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/tag'

# HexletCode module
module HexletCode
  def self.form_for(item, **args)
    @entity = item
    @result = []

    args_for_form_build = { **args.except(:url), action: args[:url].nil? ? '#' : args[:url], method: 'post' }
    @result << HexletCode::Tag.build('form', **args_for_form_build)[0..-8]

    yield(HexletCode)

    @result << '</form>'
    @result.join("\n")
  end

  def self.input(name, **args)
    callback(name)
    @result << "  #{HexletCode::Tag.build('label', for: name) { name.to_s.capitalize }}"
    if args[:as].nil?
      process_input_as_input(name)
    elsif args[:as] == :text
      process_input_as_text(name)
    end
  end

  def self.submit(*value)
    args_for_submit_build = { name: 'commit', type: 'submit', value: value[0].nil? ? 'Save' : value[0] }
    @result << "  #{HexletCode::Tag.build('input', **args_for_submit_build)}"
  end

  def self.callback(name)
    @entity.public_send(name)
  end

  def self.process_input_as_input(name)
    args_for_input_build = { class: 'user-input', name: name, type: 'text' }
    args_for_input_build[:value] = @entity[name] unless @entity[name].nil?
    @result << "  #{HexletCode::Tag.build('input', **args_for_input_build)}"
  end

  def self.process_input_as_text(name)
    @result << "  #{HexletCode::Tag.build('textarea', cols: '50', rows: '50', name: name) { @entity[name] }}"
  end
end
