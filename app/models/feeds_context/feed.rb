# frozen_string_literal: true

module FeedsContext
  class Feed < ApplicationRecord
    belongs_to :manager, class_name: 'Manager', optional: true

    named_enum :status, %w[pending declined published], _default: "pending"
  end
end
