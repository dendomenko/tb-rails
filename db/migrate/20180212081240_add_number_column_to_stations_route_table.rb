class AddNumberColumnToStationsRouteTable < ActiveRecord::Migration[5.1]
  def change
    add_column :stations_routes, :number, :integer
  end
end
