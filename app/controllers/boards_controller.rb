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
  end

  def edit
  end
end
