class ScriptsController < ApplicationController
  def index
    @scripts = Script.all
    @script = Script.new
    @packages = Package.all
  end

  def create
    @script = Script.new(script_params)
    if @script.save
      redirect_to scripts_path
    else
      render :index
    end
  end

  def show
    # _id = params[:id].to_i
    # @script = Script.find(_id)
    # @pawns = Pawn.where(script_id: _id)
    @script = Script.find(params[:id])
    @pawns = @script.pawns
    @pawn = Pawn.new
    @zas = Za.all
    @weeks = [["１週", 1], ["２週", 2], ["３週", 3], ["４週", 4], ["５週", 5], ["６週", 6], ["７週", 7], ["８週", 8], ["９週", 9], ]
    @days = [["１日", 1], ["２日", 2], ["３日", 3], ["４日", 4], ["５日", 5], ["６日", 6], ["７日", 7], ["８日", 8], ["９日", 9], ]
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def script_params
    params.require(:script).permit(:name, :package_id, :noof_days, :noof_weeks)
  end
end
