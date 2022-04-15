class AddColumnPickableCountsToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :pickable_counts, :integer, default: 0
  end
end
