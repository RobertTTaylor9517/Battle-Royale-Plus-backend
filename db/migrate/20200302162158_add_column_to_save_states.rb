class AddColumnToSaveStates < ActiveRecord::Migration[6.0]
  def change
    add_column :save_states, :team_name, :string
  end
end
