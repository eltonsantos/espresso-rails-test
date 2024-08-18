# frozen_string_literal: true

class AddNameCompanyAndRoleToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users, bulk: true do |t|
      t.string :name
      t.integer :role
      t.references :company, foreign_key: true
    end
  end
end
