# frozen_string_literal: true

# Module HexletCode
module HexletCode
  def self.input(name, **args)
    callback(name)
    @result << HexletCode::Tag.build('label', for: name) { name.to_s.capitalize }
    if args[:as].nil?
      process_input_as_input(name)
    elsif args[:as] == :text
      process_input_as_text(name)
    end
  end

  def self.submit(value = nil, **_args)
    args_for_submit_build = { name: 'commit', type: 'submit', value: value.nil? ? 'Save' : value }
    @result << HexletCode::Tag.build('input', **args_for_submit_build)
  end

  def self.callback(name)
    @entity.public_send(name)
  end

  def self.process_input_as_input(tag_name)
    args_for_input_build = { class: 'user-input', name: tag_name, type: 'text' }
    args_for_input_build[:value] = @entity[name] unless @entity[name].nil?
    @result << HexletCode::Tag.build('input', **args_for_input_build)
  end

  def self.process_input_as_text(tag_name)
    @result << HexletCode::Tag.build('textarea', cols: '50', rows: '50', name: tag_name) { @entity[name] }
  end

  def self.build_form(inner_of_form, args)
    result_form = []
    args_for_form_build = { **args.except(:url, :method),
      action: args[:url].nil? ? '#' : args[:url],
      method: args[:method].nil? ? 'post' : args[:method] }
    result_form << HexletCode::Tag.build('form', **args_for_form_build)[0..-8]

    inner_of_form.each do |item|
      result_form << "  #{item}"
    end

    result_form << '</form>'
    result_form.join("\n")
  end
end
