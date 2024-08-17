# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :categories
  has_many :users
  has_many :cards
end
