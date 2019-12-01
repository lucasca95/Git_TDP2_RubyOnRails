class CreateDeviceVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :device_versions do |t|
      t.references :device, foreign_key: true
      t.references :version, foreign_key: true
      t.integer :state

      t.timestamps
    end
  end
end
