# frozen_string_literal: true

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

  # scope :find_by_station, lambda { |station_id|
  #   joins(:stations).where(['stations.id = ? ', station_id])
  # }

  # scope :find_by_stations, lambda { |start_station_id, end_station_id|
  #   find_by_station(start_station_id) &
  #     find_by_station(end_station_id)
  # }

  scope :find_by_stations, lambda { |start_station_id, end_station_id|
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
    errors.add(:base, I18n.t('error.stations_count')) if stations.size < 2
  end
end
