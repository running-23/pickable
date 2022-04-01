class RemovePickableModeFromEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :pickable_mode, :integer
  end
end
