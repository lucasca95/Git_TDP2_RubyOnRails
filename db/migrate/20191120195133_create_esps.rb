class CreateEsps < ActiveRecord::Migration[5.1]
  def change
    create_table :esps do |t|
      t.string :mac
      t.integer :version

      t.timestamps
    end
  end
end
