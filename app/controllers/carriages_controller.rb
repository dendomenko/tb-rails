class CarriagesController < ApplicationController
  before_action :set_carriage, only: [:show]

  def new
    @train = Train.find(params[:train_id])
    @carriage = Carriage.new
  end

  def create
    @carriage = Carriage.new(carriage_params)
    if @carriage.save
      redirect_to @carriage.train
    else
      render :new
    end
  end

  def show; end

  private

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def carriage_params
    params.require(:carriage).permit(:type, :top_seats, :bottom_seats,
                                     :train_id, :side_top_seats,
                                     :side_bottom_seats)
  end
end
