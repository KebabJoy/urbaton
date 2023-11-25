class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  class << self
    def named_enum(attr, array = [], **options)
      enum(attr => array.to_h { |item| [item.to_s, item.to_s] }, **options)
    end
  end
end
