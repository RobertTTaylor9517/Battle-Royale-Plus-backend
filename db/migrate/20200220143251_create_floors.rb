class CreateFloors < ActiveRecord::Migration[6.0]
  def change
    create_table :floors do |t|
      t.integer :dungeon_id
      t.string :difficulty

      t.timestamps
    end
  end
end
