class ZasController < ApplicationController
  def index
    @zas = Za.all
    @za = Za.new
  end

  def new
  end

  def create
    @za = Za.new(za_params)
    if @za.save
      redirect_to zas_path
    else
      render :index
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def za_params
    params.require(:za).permit(:name, :paranoia_limit, :image)
  end
end
