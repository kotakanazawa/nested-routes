class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.string :title
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
