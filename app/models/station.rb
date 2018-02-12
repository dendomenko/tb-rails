class Station < ApplicationRecord
  has_many :stations_routes
  has_many :routes, through: :stations_routes
  has_many :trains, inverse_of: :current_station, foreign_key: 'current_station_id'

  validates :name, presence: true

  scope :order_by_number, lambda {
    joins(:stations_routes)
      .order('stations_routes.number').uniq
  }

  def update_number(route, number, arrival_time, departure_time)
    station_route = station_route(route)
    station_route&.update(number: number,
                          arrival_time: arrival_time,
                          departure_time: departure_time)
  end

  def route_data(route, data)
    station_route(route).try(data)
  end

  protected

  def station_route(route)
    @station_route ||= stations_routes.where(route: route).first
  end
end
