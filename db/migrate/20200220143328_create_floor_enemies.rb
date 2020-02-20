class CreateFloorEnemies < ActiveRecord::Migration[6.0]
  def change
    create_table :floor_enemies do |t|
      t.integer :floor_id
      t.integer :enemy_id

      t.timestamps
    end
  end
end
