class ChangeColumnToNull < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :mattermost_id, :string, null: true
  end
end
