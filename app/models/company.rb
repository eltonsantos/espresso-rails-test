# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :categories, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :cards, dependent: :destroy
end
