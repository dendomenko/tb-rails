class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show]
  before_action :set_train, only: %i[new create]

  def show; end

  def create
    @ticket = @train.tickets.new(ticket_params)
    @ticket.user = User.first
    if @ticket.save!
      redirect_to [@train, @ticket]
    else
      render :new
    end
  end

  def new
    @ticket = Ticket.new
    @ids = [params[:end], params[:start]]
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end

  def ticket_params
    params.require(:ticket).permit(:first_name, :last_name,
                                   :middle_name, :passport,
                                   :start_station_id,
                                   :end_station_id)
  end
end
