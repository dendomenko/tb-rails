class Route < ApplicationRecord
  has_many :trains
  has_many :stations_routes, dependent: :destroy
  has_many :stations, through: :stations_routes

  validates :name, presence: true
  validate :stations_count

  before_validation :set_name

  def first_station
    stations.first
  end

  scope :find_by_stations, ->(start_station_id, end_station_id) {
    route_ids = joins(:stations_routes)
                .where(['stations_routes.station_id = ? ', start_station_id])
                .pluck(:route_id)
    joins(:stations_routes)
      .where(['stations_routes.station_id = ? ' \
              'AND stations_routes.route_id IN (?)',
              end_station_id, route_ids]).uniq
  }

  private

  def set_name
    self.name = "#{stations.first.name} - #{stations.last.name}"
  end

  def stations_count
    errors.add(:base, 'Stations must be > 1') if stations.size < 2
  end
end
