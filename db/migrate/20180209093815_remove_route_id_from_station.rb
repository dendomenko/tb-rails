class RemoveRouteIdFromStation < ActiveRecord::Migration[5.1]
  def change
    remove_column :stations, :route_id
  end
end
