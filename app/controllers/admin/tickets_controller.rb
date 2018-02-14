# frozen_string_literal: true

module Admin
  class TicketsController < Admin::BaseController
    before_action :set_ticket, only: %i[show destroy edit update]

    def show; end

    def index
      @tickets = Ticket.all
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

    def edit; end

    def update
      if @ticket.update(ticket_params)
        redirect_to [:admin, @ticket], notice: 'Ticket was successfully updated'
      else
        render :edit
      end
    end

    def destroy
      @ticket.destroy
      redirect_to tickets_url, notice: 'Successfully destroyed.'
    end

    private

    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:first_name, :last_name,
                                     :middle_name, :passport,
                                     :start_station_id,
                                     :end_station_id)
    end
  end
end
