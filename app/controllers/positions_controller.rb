class PositionsController < ApplicationController
  def index_all
    @positions = Position.all
    @position = Position.new
  end

  def index
    @package = Package.find(params[:package_id])
    @positions = @package.positions
  end

  def new
  end

  def show
  end

  def edit
  end
end
