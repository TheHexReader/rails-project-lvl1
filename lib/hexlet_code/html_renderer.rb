# frozen_string_literal: true

# Module HexletCode
module HexletCode
  # HTML renderer class
  class HtmlRenderer
    def self.render(form_builder, args)
      for_render = form_builder.result
      inner_form = []
      for_render.each do |item|
        inner_form << HexletCode::Tag.build(item[:tag], **item[:attrs]) { item[:inner] }
      end
      inner_form = inner_form.map { |item| "  #{item}\n" }
      HexletCode::Tag.build('form', **parse_form_args(args)) { "\n#{inner_form.join}" }
    end

    def self.parse_form_args(args)
      args[:action] = args[:url].nil? ? '#' : args[:url]
      args[:method] = args[:method].nil? ? 'post' : args[:method]
      args.except(:url)
    end
  end
end
