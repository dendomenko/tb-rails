class Route < ApplicationRecord
  has_many :stations

  validates :name, presence: true
end
