class AddColumnUsersToGithubName < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :github_name, :string, null: false
  end
end
