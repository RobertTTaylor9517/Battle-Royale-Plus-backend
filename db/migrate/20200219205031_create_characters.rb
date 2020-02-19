class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.integer :team_id
      t.string :name
      t.integer :health
      t.string :focus

      t.timestamps
    end
  end
end
