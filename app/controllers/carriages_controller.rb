class CarriagesController < ApplicationController
  def new
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

  private

  def carriage_params
    params.require(:carriage).permit(:type, :top_seats, :bottom_seats, :train_id, :side_top_seats, :side_bottom_seats)
  end
end
