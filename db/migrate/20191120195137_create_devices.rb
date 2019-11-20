class CreateDevices < ActiveRecord::Migration[5.1]
  def change
    create_table :devices do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.references :target, foreign_key: true
      t.references :esp, foreign_key: true

      t.timestamps
    end
  end
end
