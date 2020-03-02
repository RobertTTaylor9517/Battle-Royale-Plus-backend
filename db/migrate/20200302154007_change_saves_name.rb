class ChangeSavesName < ActiveRecord::Migration[6.0]
  def change
    rename_table :saves, :save_states
  end
end
