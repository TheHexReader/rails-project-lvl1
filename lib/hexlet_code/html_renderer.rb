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
      input_renderer = HexletCode::Inputs.const_get "#{item[:input_type].capitalize}Input"
      input_renderer.render(item)
    end
  end
end
