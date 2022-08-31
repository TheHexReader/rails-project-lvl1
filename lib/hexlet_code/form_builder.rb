# frozen_string_literal: true

# Module HexletCode
module HexletCode
  # Form Builder class
  class FormBuilder
    attr_accessor :result

    def initialize(item, result)
      @entity = item
      @result = result
    end

    def input(name, **args)
      get_attr_value = @entity.public_send(name)

      @result << {
        input_type: args.fetch(:as, :default),
        attr_value: get_attr_value,
        tag_name: name,
        **args.except(:as)
      }
    end

    def submit(tag_value = 'Save', **args)
      @result << {
        input_type: :submit,
        value: tag_value,
        **args
      }
    end
  end
end
