class RemoveColumnMattermostIdToUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :mattermost_id, :string
  end
end
