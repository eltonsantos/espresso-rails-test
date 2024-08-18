# frozen_string_literal: true

class AddProofAndArchivedToStatements < ActiveRecord::Migration[5.2]
  def change
    change_table :statements, bulk: true do |t|
      t.boolean :proof, default: false, null: false
      t.boolean :archived, default: false, null: false
    end
  end
end
