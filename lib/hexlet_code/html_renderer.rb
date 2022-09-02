# frozen_string_literal: true

# Module HexletCode
module HexletCode
  # HTML renderer class
  class HtmlRenderer
    def self.render(form_builder, args)
      form_items = form_builder.result.map { |item| decide_how_to_render(item) }.flatten

      form_items = form_items.map { |item| "  #{item}\n" }
      HexletCode::Tag.build('form', **parse_form_args(args)) { "\n#{form_items.join}" }
    end

    def self.parse_form_args(args)
      args[:action] = args.fetch(:url, '#')
      args[:method] = args.fetch(:method, 'post')
      args.except(:url)
    end

    def self.decide_how_to_render(item)
      case item[:input_type]
      when :default
        render_input_default(item)
      when :text
        render_input_text(item)
      when :submit
        render_input_submit(item)
      end
    end

    def self.render_input_default(item)
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

    def self.render_input_text(item)
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

    def self.render_input_submit(item)
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
