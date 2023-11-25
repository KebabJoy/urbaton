# frozen_string_literal: true

class BaseQuery
  attr_reader :base_collection

  def initialize(&base_collection)
    @base_collection = base_collection
  end

  def call(method_name = :all, *args, preloaders: proc { _1 }, **options)
    public_send(method_name, apply_querying(base_collection.call, preloaders:), *args, **options)
  end

  def all(collection)
    collection
  end

  private

  def apply_querying(collection, preloaders:)
    preloaders.call(collection)
  end
end
