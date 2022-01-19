class PawnsController < ApplicationController
  def index
  end

  def new
  end

  def create
    p "予定地店へ到着〜"
    p params
    p "以上がパラメーターなり"
    @pawn = Pawn.new(pawn_params)
    @pawn.script_id = params[:script_id].to_i
    @pawn.position_id = 1
    p @pawn
    p "以上が新しい@pawnなり"
    if @pawn.save
      redirect_to script_path(@pawn.script)
      p "セーブしたよー"
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
