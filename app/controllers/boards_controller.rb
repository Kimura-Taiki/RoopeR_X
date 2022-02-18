class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
  end

  # def create
  #   @board = Board.new
  #   @board.week = 1
  #   @board.day = 1
  #   if @board.save
  #     redirect_to @board
  #   else
  #     render :index
  #   end
  # end

  def create
    @board = Board.board_create
    if @board
      redirect_to @board
    else
      render :index
    end
  end

  def show
    @cards = Board.find(params[:id]).cards
    @hospital = @cards.where(current_area: 1).preload(:current_area)
    @shrine = @cards.where(current_area: 2).preload(:current_area)
    @city = @cards.where(current_area: 3).preload(:current_area)
    @school = @cards.where(current_area: 4).preload(:current_area)
    new_modal_construct(params[:id])
    # @board = Board.find(params[:id])
    # @hospital = @board.cards.where(current_area_id: 1)
    # @shrine = @board.cards.where(current_area_id: 2)
    # @city = @board.cards.where(current_area_id: 3)
    # @school = @board.cards.where(current_area_id: 4)
    # new_modal_construct(params[:id])
  end

  def edit
  end

  private
  def new_modal_construct(id)
    @board = Board.find(id)
    @card = Card.new
    @zas = Za.all
    @positions = Position.all
  end
end
