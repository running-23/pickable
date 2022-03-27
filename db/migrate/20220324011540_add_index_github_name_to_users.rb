class AddIndexGithubNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :github_name, unique: true
  end
end
