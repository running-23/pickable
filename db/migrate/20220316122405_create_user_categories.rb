class CreateUserCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :user_categories do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true, index: false

      t.timestamps
    end
    add_index :user_categories, %i[category_id user_id], unique: true
  end
end
