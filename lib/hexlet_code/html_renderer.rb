# frozen_string_literal: true

# Module HexletCode
module HexletCode
  # HTML renderer class
  class HtmlRenderer
    def self.render(form_builder, args)
      for_render = form_builder.result
      inner_form = []
      for_render.each do |item|
        render_item(item, inner_form)
      end
      inner_form = inner_form.map { |item| "  #{item}\n" }
      HexletCode::Tag.build('form', **parse_form_args(args)) { "\n#{inner_form.join}" }
    end

    def self.parse_form_args(args)
      args[:action] = args.fetch(:url, '#')
      args[:method] = args.fetch(:method, 'post')
      args.except(:url)
    end

    def self.render_item(item, inner_form)
      if item[:has_label] == true
        inner_form << HexletCode::Tag.build('label', for: item[:attrs][:name]) { item[:attrs][:name].to_s.capitalize }
      end
      inner_form << HexletCode::Tag.build(item[:tag], **item[:attrs]) { item[:inner] }
    end
  end
end
