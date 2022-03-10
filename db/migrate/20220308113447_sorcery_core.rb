class SorceryCore < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :mattermost_id,            null: false, index: { unique: true }
      t.string :name,                     null: false
      t.string :email,                    null: false, index: { unique: true }
      t.integer :accept_random,           null: false, default: 0
      t.string :crypted_password
      t.string :salt
      t.integer :role, null:false, default: 0

      t.timestamps                null: false
    end
  end
end
