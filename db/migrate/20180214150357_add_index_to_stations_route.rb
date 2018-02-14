class AddIndexToStationsRoute < ActiveRecord::Migration[5.1]
  def change
    add_index :stations_routes, :station_id
    add_index :stations_routes, :route_id
  end
end
