class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.integer :number_of_members, null: false
      t.integer :number_of_applicants, null: false, default: 0
      t.datetime :scheduled_date, null: false
      t.string :place, null: false
      t.integer :pickable_mode, null: false

      t.timestamps
    end
  end
end
