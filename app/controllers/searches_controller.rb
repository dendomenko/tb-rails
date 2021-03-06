# frozen_string_literal: true

class SearchesController < ApplicationController
  def show
    @stations = Station.all
  end

  def search_route
    @start_station = Station.find params[:start_station_id]
    @end_station = Station.find params[:end_station_id]
    @routes = Route.find_by_stations(@start_station.id, @end_station.id)
  end
end
