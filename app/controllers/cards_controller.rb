class CardsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @card = Card.new(card_params)
    _area = @card.za.area
    @card.first_area = _area
    @card.current_area = _area
    @card.board_id = params[:board_id].to_i
    if @card.save
      redirect_to @card.board
    else
      render :index
    end
  end

  def show
  end

  def edit
  end

  private
  def card_params
    params.require(:card).permit(:id, :board_id, :za_id, :position_id)
  end
end
