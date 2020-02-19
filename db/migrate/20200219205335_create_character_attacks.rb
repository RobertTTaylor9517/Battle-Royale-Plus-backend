class CreateCharacterAttacks < ActiveRecord::Migration[6.0]
  def change
    create_table :character_attacks do |t|
      t.integer :character_id
      t.integer :attack_id

      t.timestamps
    end
  end
end
