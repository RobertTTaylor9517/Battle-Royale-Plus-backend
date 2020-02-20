class AddColumnDifficultyToEnemies < ActiveRecord::Migration[6.0]
  def change
    add_column :enemies, :difficulty, :string
  end
end
