# frozen_string_literal: true

class TicketsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_ticket, only: %i[show destroy]
  before_action :set_train, only: %i[new create]

  def show; end

  def index
    @tickets = current_user.tickets
  end

  def create
    @ticket = @train.tickets.new(ticket_params)
    @ticket.user = current_user
    if @ticket.save
      redirect_to [@train, @ticket]
    else
      render :new
    end
  end

  def new
    @ticket = Ticket.new
    @ids = [params[:end], params[:start]]
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_url, notice: 'Successfully destroyed.'
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
