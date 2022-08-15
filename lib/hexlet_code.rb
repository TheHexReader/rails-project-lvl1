# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/tag'
require_relative 'hexlet_code/form_builder'

# HexletCode module
module HexletCode
  autoload(:Tag, './lib/hexlet_code/tag.rb')
  autoload(:HexletCode, './lib/hexlet_code/form_builder.rb')
  def self.form_for(item, **args)
    @entity = item
    @result = []

    yield(HexletCode)

    build_form(@result, args)
  end
end
