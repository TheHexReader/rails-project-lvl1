# frozen_string_literal: true

require_relative 'hexlet_code/version'

# HexletCode module
module HexletCode
  autoload :Tag, 'hexlet_code/tag.rb'
  autoload :FormBuilder, 'hexlet_code/form_builder.rb'
  autoload :HtmlRenderer, 'hexlet_code/html_renderer.rb'

  def self.form_for(item, **args)
    form_builder = HexletCode::FormBuilder.new(item, [])

    yield(form_builder)

    HexletCode::HtmlRenderer.render(form_builder, args)
  end
end
