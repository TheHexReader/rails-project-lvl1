# frozen_string_literal: true

require_relative 'hexlet_code/version'

# HexletCode module
module HexletCode
  autoload :Tag, 'hexlet_code/tag.rb'
  autoload :FormFormer, 'hexlet_code/form_former.rb'
  autoload :HTMLRenderer, 'hexlet_code/html_renderer.rb'

  def self.form_for(item, **args)
    HexletCode::FormFormer.entity = item
    HexletCode::FormFormer.result = []

    yield(HexletCode::FormFormer)

    HexletCode::HTMLRenderer.render(args)
  end
end
