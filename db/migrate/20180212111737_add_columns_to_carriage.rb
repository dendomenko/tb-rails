class AddColumnsToCarriage < ActiveRecord::Migration[5.1]
  def change
    add_column :carriages, :side_top_seats, :integer
    add_column :carriages, :side_bottom_seats, :integer
    add_column :carriages, :number, :integer
  end
end
