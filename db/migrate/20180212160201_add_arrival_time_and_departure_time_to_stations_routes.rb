class AddArrivalTimeAndDepartureTimeToStationsRoutes < ActiveRecord::Migration[5.1]
  def change
    add_column :stations_routes, :arrival_time, :time
    add_column :stations_routes, :departure_time, :time
  end
end
