class DeleteRailwayStations < ActiveRecord::Migration[5.1]
  def change
    drop_table :railway_stations
  end
end
