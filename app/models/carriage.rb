class Carriage < ApplicationRecord
  belongs_to :train

  validates :bottom_seats, presence: true
  validates :number, uniqueness: { scope: :train_id }

  after_create :set_number

  scope :coupes, -> { where(type: 'CoupeCarriage') }
  scope :economs, -> { where(type: 'EconomCarriage') }

  private

  def set_number
    self.number = Carriage.where(train_id: train_id).count(:id) + 1
    save
  end
end
