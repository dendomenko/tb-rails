class CreateCarriage < ActiveRecord::Migration[5.1]
  def change
    create_table :carriages do |t|
      t.string :type
      t.integer :top_seats
      t.integer :bottom_seats
    end
    add_reference :carriages, :train, foreign_key: true
  end
end
