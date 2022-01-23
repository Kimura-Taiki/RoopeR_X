class PawnsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @pawn = Pawn.new(pawn_params)
    @pawn.script_id = params[:script_id].to_i
    if @pawn.save
      redirect_to @pawn.script
    else
      render "scripts/#{@pawn.script_id}"
    end
  end

  def show
  end

  def edit
  end

  private
  def pawn_params
    params.require(:pawn).permit(:script_id, :za_id, :position_id)
  end
end
