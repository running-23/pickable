class RemoveUniquenessOfHiyoconneUrl < ActiveRecord::Migration[6.1]
  def change
    remove_index :users, :hiyoconne_url, unique: true
  end
end
