class Route < ApplicationRecord
  has_many :stations
  has_many :trains

  validates :name, presence: true
end
