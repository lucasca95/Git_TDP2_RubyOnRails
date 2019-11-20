class CreateJoinTableTargetProgram < ActiveRecord::Migration[5.1]
  def change
    create_join_table :targets, :programs do |t|
      # t.index [:target_id, :program_id]
      # t.index [:program_id, :target_id]
    end
  end
end
