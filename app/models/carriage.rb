class Carriage < ApplicationRecord
  belongs_to :train

  validates :top_seats, presence: true
  validates :bottom_seats, presence: true

  scope :coupes, -> { where(type: 'Coupe') }
  scope :economs, -> { where(type: 'Econom') }
end
