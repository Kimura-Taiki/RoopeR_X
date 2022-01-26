class PawnsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @pawn = Pawn.new(pawn_params)
    @pawn.script_id = params[:script_id].to_i
    @pawn.id = nil
    p "--------チェックの時間だ--------"
    p params
    p @pawn
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

  def update
    @req = params.require(:pawn)
    @pawn = Pawn.find(@req[:id])
    @pawn.update(pawn_params)
    redirect_to script_path(@pawn.script)
  end

  def destroy
    p "destroy"
    p params
    p params[:id]
    @pawn = Pawn.find(params[:id])
    p @pawn
    @script = @pawn.script
    @pawn.destroy
    redirect_to @script
  end

  private
  def pawn_params
    params.require(:pawn).permit(:id, :script_id, :za_id, :position_id)
  end
end
