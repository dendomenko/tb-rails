# frozen_string_literal: true

class CoupeCarriage < Carriage
  validates :top_seats, presence: true
end
