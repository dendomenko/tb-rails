class ChangeTrain < ActiveRecord::Migration[5.1]
  def change
    add_reference :trains, :current_station, index: true
    add_foreign_key :trains, :stations, column: :current_station_id
  end
end
