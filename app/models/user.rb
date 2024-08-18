# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :company, optional: true
  has_one :card, dependent: :destroy

  enum role: { admin: 0, employee: 1 }

  validates :name, presence: true

  accepts_nested_attributes_for :company
end
