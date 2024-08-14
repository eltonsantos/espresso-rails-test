class CreateAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :attachments do |t|
      t.attachment :file
      t.references :statement, foreign_key: true

      t.timestamps
    end
  end
end
