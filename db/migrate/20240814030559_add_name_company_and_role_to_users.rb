# frozen_string_literal: true

class AddNameCompanyAndRoleToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :role, :integer
    add_reference :users, :company, foreign_key: true
  end
end
