class AddTimescaleToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :timescale, :time
  end
end
