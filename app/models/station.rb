class Station < ApplicationRecord
  has_many :stations_routes
  has_many :routes, through: :stations_routes
  has_many :trains, inverse_of: :current_station, foreign_key: 'current_station_id'
end
