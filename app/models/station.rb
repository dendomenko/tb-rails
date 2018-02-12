class Station < ApplicationRecord
  has_many :stations_routes
  has_many :routes, through: :stations_routes
  has_many :trains, inverse_of: :current_station, foreign_key: 'current_station_id'

  validates :name, presence: true

  scope :order_by_number, -> { select('stations.*, stations_routes.number').joins(:stations_routes).order('stations_routes.number').uniq }
end
