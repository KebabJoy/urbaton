# frozen_string_literal: true

module BaseRenderers
  extend ActiveSupport::Concern

  private

  def render_created(entity)
    render json: {id: entity.id}, status: :created
  end

  def render_updated(entity = nil)
    entity ? render(json: {id: entity.id}, status: :ok) : head(:no_content)
  end

  def render_unprocessable_entity(attrs = {})
    render_error(:unprocessable_entity, prepare_error_payload(attrs))
  end


  # TODO: Уметь передавать весь payload в NotFoundError и сделать по-человечески
  def raise_not_found(error_klass, attrs = {})
    payload = prepare_error_payload(attrs)

    raise error_klass, payload[:message]
  end

  def render_not_found(attrs = {})
    render_error(:not_found, prepare_error_payload(attrs))
  end

  def render_forbidden(code: :forbidden, message: "Forbidden")
    render_error(:forbidden, code: code, message: message)
  end

  def render_unauthorized(attrs = {code: :unauthorized, message: "Not authorized"})
    render_error(:unauthorized, prepare_error_payload(attrs))
  end

  def render_error(status, attrs = {})
    render json: UnprocessableEntityJbuilder.new.call(
      camelize_keys: camelize_keys?,
      # Content
      errors: attrs.fetch(:errors, {}),
      message: attrs[:message],
      code: attrs.fetch(:code, status),
      meta: attrs[:meta]
    ), status: status
  end

  def prepare_error_payload(attrs)
    # return DomainErrorDecoratorFactory.decorator_for(attrs).to_response if attrs.is_a?(DomainError)

    error_key = attrs[:error_key]
    attrs[:errors] ||= {}
    attrs[:errors] = build_errors_for_key(error_key: error_key, error_message: attrs[:message]) if error_key

    attrs
  end

  def build_errors_for_key(error_key:, error_message:)
    array_of_error_keys = Array.wrap(error_key).reverse
    error_value = Array(error_message)

    array_of_error_keys[1..].reduce({array_of_error_keys.first => error_value}) do |memo, key|
      {key => memo}
    end
  end
end
