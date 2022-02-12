class CardsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @card = Card.new(card_params)
    @card.location = @card.za.first_location
    @card.first_location = Card.locations[@card.location]
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
