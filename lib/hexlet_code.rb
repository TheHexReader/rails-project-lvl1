# frozen_string_literal: true

require_relative 'hexlet_code/version'

# HexletCode module
module HexletCode
  autoload(:Tag, File.expand_path('./lib/hexlet_code/tag.rb'))
  autoload(:HexletCode, File.expand_path('./lib/hexlet_code/form_builder.rb'))
  def self.form_for(item, **args)
    @entity = item
    @result = []

    yield(HexletCode)

    build_form(@result, args)
  end
end
