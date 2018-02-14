# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :user

  belongs_to :start_station, class_name: 'Station',
                             foreign_key: 'start_station_id'
  belongs_to :end_station, class_name: 'Station', foreign_key: 'end_station_id'

  after_create :send_notification

  validates :first_name, :last_name, :middle_name, :passport, presence: true

  def full_name
    "#{first_name} #{last_name} #{middle_name}"
  end

  def route_name
    "#{start_station.name} - #{end_station.name}"
  end

  def send_notification
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end
end
