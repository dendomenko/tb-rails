# frozen_string_literal: true

class EconomCarriage < Carriage
  validates :top_seats, :side_top_seats, :side_bottom_seats, presence: true
end
