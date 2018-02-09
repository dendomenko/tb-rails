class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :update, :destroy]

  def index
    @routes = Route.all
  end

  def show; end

  def new
    @route = Route.new
  end

  def create
    @route = Route.new(route_params)
    redirect_to @route, notice: 'Route was  created.' if @route.save
  end

  def edit; end

  def update
    redirect_to @route, notice: 'Route was updated' if @route
                                                       .update(route_params)
  end

  def destroy
    @route.destroy
    redirect_to routes_url, notice: 'Route was successfully destroyed.'
  end

  private

  def set_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:name)
  end
end
