# frozen_string_literal: true

class Statement < ApplicationRecord
  belongs_to :card, optional: true
  belongs_to :category, optional: true

  has_one :attachment, dependent: :destroy

  validates :performed_at, :cost, :merchant, :transaction_id, presence: true
end
