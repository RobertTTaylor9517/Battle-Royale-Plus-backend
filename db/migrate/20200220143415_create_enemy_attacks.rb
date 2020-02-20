class CreateEnemyAttacks < ActiveRecord::Migration[6.0]
  def change
    create_table :enemy_attacks do |t|
      t.integer :enemy_id
      t.integer :attack_id

      t.timestamps
    end
  end
end
