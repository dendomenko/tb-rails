# frozen_string_literal: true

module Admin
  class RoutesController < Admin::BaseController
    before_action :set_route, only: %i[show edit update destroy]

    def index
      @routes = Route.all
    end

    def show; end

    def new
      @route = Route.new
    end

    def create
      @route = Route.new(route_params)
      if @route.save
        redirect_to [:admin, @route], notice: 'Route was created.'
      else
        render :new
      end
    end

    def edit; end

    def update
      if @route.update(route_params)
        redirect_to [:admin, @route], notice: 'Route was updated'
      else
        render :edit
      end
    end

    def destroy
      @route.destroy
      redirect_to admin_routes_url, notice: 'Route was successfully destroyed.'
    end

    private

    def set_route
      @route = Route.find(params[:id])
    end

    def route_params
      params.require(:route).permit(:name, station_ids: [])
    end
  end
end
