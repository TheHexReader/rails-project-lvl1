# frozen_string_literal: true

require_relative 'hexlet_code/version'

# HexletCode module
module HexletCode
  autoload :Tag, 'hexlet_code/tag.rb'
  autoload :FormBuilder, 'hexlet_code/form_builder.rb'
  autoload :HtmlRenderer, 'hexlet_code/html_renderer.rb'

  def self.form_for(item, **args)
    HexletCode::FormBuilder.entity = item
    HexletCode::FormBuilder.result = []

    yield(HexletCode::FormBuilder)

    HexletCode::HtmlRenderer.render(args)
  end
end
