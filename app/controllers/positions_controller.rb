class PositionsController < ApplicationController
  def index
    @positions = Position.all
    @position = Position.new
  end

  def new
  end

  def show
  end

  def edit
  end
end
