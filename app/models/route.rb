class Route < ApplicationRecord
  has_many :trains
  has_many :stations_routes
  has_many :stations, through: :stations_routes

  validates :name, presence: true
  validate :stations_count

  before_validation :set_name

  private

  def set_name
    self.name = "#{stations.first.name} - #{stations.last.name}"
  end

  def stations_count
    errors.add(:base, 'Stations must be > 1') if stations.size < 2
  end
end
