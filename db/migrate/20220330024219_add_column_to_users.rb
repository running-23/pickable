class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :hiyoconne_url, :string
    add_index :users, :hiyoconne_url, unique: true
  end
end
