class AddProofAndArchivedToStatements < ActiveRecord::Migration[5.2]
  def change
    add_column :statements, :proof, :boolean, default: false
    add_column :statements, :archived, :boolean, default: false
  end
end
