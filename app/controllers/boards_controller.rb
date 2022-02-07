class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
  end

  def create
    @board = Board.new
    @board.week = 1
    @board.day = 1
    if @board.save
      redirect_to @board
    else
      render :index
    end
  end

  def show
    @board = Board.find(params[:id])
    @hospital = @board.cards.where(location: :hospital)
    @shrine = @board.cards.where(location: :shrine)
    @city = @board.cards.where(location: :city)
    @school = @board.cards.where(location: :school)
  end

  def edit
  end
end
