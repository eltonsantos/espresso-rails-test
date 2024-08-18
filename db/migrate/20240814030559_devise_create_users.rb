# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_users_table
    add_indexes_to_users
  end

  private

  def create_users_table
    create_table :users do |t|
      t.string :email, null: false, default: ''
      t.string :encrypted_password, null: false, default: ''
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.references :company, foreign_key: true

      t.timestamps
    end
  end

  def add_indexes_to_users
    change_table :users, bulk: true do |t|
      t.index :email, unique: true
      t.index :reset_password_token, unique: true
    end
  end
end
