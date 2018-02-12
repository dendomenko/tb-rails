class Train < ApplicationRecord
  belongs_to :route
  has_many :tickets
  has_many :carriages

  belongs_to :current_station, class_name: 'Station', foreign_key: 'current_station_id'

  def count_seats(type, seat_type)
    carriages.where(type: type).sum(seat_type)
  end
end
