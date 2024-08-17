# frozen_string_literal: true

class AddNameCompanyAndRoleToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_reference :users, :company, foreign_key: true
    add_column :users, :role, :integer
  end
end
