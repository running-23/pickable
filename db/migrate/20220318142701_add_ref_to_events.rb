class AddRefToEvents < ActiveRecord::Migration[6.1]
  def change
    add_reference :events, :user, foreign_key: true
    add_reference :events, :category, foreign_key: true
  end
end
