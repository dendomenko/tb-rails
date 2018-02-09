class CreateStation < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.string :name
    end
    add_reference :stations, :route, index: true
    add_foreign_key :stations, :routes
  end
end
