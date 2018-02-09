class Route < ApplicationRecord
  has_many :stations_routes
  has_many :stations, through: :stations_routes

  validates :name, presence: true
end
