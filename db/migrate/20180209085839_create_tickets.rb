class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.timestamps
    end

    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.timestamps
    end

    add_reference :tickets, :train, foreign_key: true

    add_reference :tickets, :user, foreign_key: true

    add_reference :tickets, :start_station, index: true
    add_foreign_key :tickets, :stations, column: :start_station_id

    add_reference :tickets, :end_station, index: true
    add_foreign_key :tickets, :stations, column: :end_station_id
  end
end
