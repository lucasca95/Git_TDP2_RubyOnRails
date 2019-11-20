class CreateJoinTableDeviceVersion < ActiveRecord::Migration[5.1]
  def change
    create_join_table :devices, :versions do |t|
       t.index [:device_id, :version_id]
       t.index [:version_id, :device_id]
       t.timestamps
    end
  end
end
