class ChangeColumnsNotnullPickableCounts < ActiveRecord::Migration[6.1]
  def change
    change_column :events, :pickable_counts, :integer, default: 0, null: false
  end
end
