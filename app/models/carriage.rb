class Carriage < ApplicationRecord
  belongs_to :train

  validates :bottom_seats, presence: true
  validates :number, uniqueness: { scope: :train_id }

  before_create :set_number

  scope :coupes, -> { where(type: 'CoupeCarriage') }
  scope :economs, -> { where(type: 'EconomCarriage') }

  scope :order_by_tail, ->(tail) { order(number: tail ? :desc : :asc) }
  scope :order_by_number, lambda {
    select('stations.*, stations_routes.number')
      .joins(:stations_routes).order('stations_routes.number').uniq
  }

  def self.types
    %w[EconomCarriage CoupeCarriage SedentaryCarriage SleepCarriage]
  end

  private

  def set_number
    self.number = Carriage.where(train_id: train_id).count(:id) + 1
  end
end
