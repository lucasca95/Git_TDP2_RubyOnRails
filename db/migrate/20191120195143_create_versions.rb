class CreateVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :versions do |t|
      t.integer :number
      t.string :changelog
      t.references :program, foreign_key: true
      t.timestamps
    end
  end
end
