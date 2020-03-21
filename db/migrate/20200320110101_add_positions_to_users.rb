class AddPositionsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :position_latitude, :float
    add_column :users, :position_longitude, :float
  end
end
