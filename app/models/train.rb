class Train < ApplicationRecord
  belongs_to :route
  has_many :tickets
  has_many :carriages

  belongs_to :current_station, class_name: 'Station', foreign_key: 'current_station_id'

  # scope :econom_seats, ->(seat_type) { carriages.economs.sum(seat_type) }
  def econom_seats(seat_type)
    carriages.economs.sum(seat_type)
  end

  def coupe_seats(seat_type)
    carriages.coupes.sum(seat_type)
  end
end
