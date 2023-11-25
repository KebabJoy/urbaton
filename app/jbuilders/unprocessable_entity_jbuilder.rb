# frozen_string_literal: true

class UnprocessableEntityJbuilder
  def call(errors:, camelize_keys:, message: nil, code: :unprocessable_entity, meta: nil)
    Jbuilder.encode do |json|
      json.key_format!(camelize: :lower) if camelize_keys

      json.code(code)
      json.message(message)
      json.errors(errors)
      json.meta(meta) if meta
    end
  end
end
