# frozen_string_literal: true

class CreateStatements < ActiveRecord::Migration[5.2]
  def change
    create_statements_table
  end

  private

  def create_statements_table
    create_table :statements do |t|
      t.datetime :performed_at
      t.integer :cost
      t.string :merchant
      t.string :transaction_id
      t.references :card, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
