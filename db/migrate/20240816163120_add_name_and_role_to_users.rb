# frozen_string_literal: true

class AddNameAndRoleToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users, bulk: true do |t|
      t.string :name
      t.integer :role
    end
  end
end
