# frozen_string_literal: true

class Statement < ApplicationRecord
  scope :by_company, ->(company_id) { joins(card: :user).where(users: { company_id: company_id }) }
  scope :archived, -> { where(archived: true) }
  scope :not_archived, -> { where(archived: false) }
  scope :by_user, ->(user_id) { joins(:card).where(cards: { user_id: user_id }) }
  scope :ordered_by_performed_at, -> { order(performed_at: :desc) }

  belongs_to :card, optional: true
  belongs_to :category, optional: true

  has_one :attachment, dependent: :destroy

  validates :performed_at, :cost, :merchant, :transaction_id, presence: true
end
