# frozen_string_literal: true

module Admin
  class StationsController < Admin::BaseController
    before_action :set_station, only: %i[show edit update destroy update_number]

    def index
      @stations = Station.all
    end

    def show; end

    def new
      @station = Station.new
    end

    def edit; end

    def create
      @station = Station.new(station_params)
      if @station.save
        redirect_to [:admin, @station], notice: 'Successfully created.'
      else
        render :new
      end
    end

    def update
      if @station.update(station_params)
        redirect_to [:admin, @station], notice: 'Successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @station.destroy
      redirect_to admin_stations_url, notice: 'Successfully destroyed'
    end

    def update_number
      @route = Route.find(params[:route_id])
      @station.update_number(@route, params[:number], params[:arrival_time],
                             params[:departure_time])
      redirect_to [:admin, @route]
    end

    private

    def set_station
      @station = Station.find(params[:id])
    end

    def station_params
      params.require(:station).permit(:name)
    end
  end
end
