class ScriptsController < ApplicationController
  def index
    @scripts = Script.all
    @script = Script.new
    @packages = Package.all
    @y_rules = Package.find(1).rules.where(xy: :rule_y)
    @x_rules = Package.find(1).rules.where(xy: :rule_x)
    p @y_rules
    p @x_rules
    @weeks = [["１週", 1], ["２週", 2], ["３週", 3], ["４週", 4], ["５週", 5], ["６週", 6], ["７週", 7], ["８週", 8], ["９週", 9], ]
    @days = [["１日", 1], ["２日", 2], ["３日", 3], ["４日", 4], ["５日", 5], ["６日", 6], ["７日", 7], ["８日", 8], ["９日", 9], ]
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
    p "----------スタート----------"
    @script = Script.find(params[:id])
    @y_rules = @script.package.rules.where(xy: :rule_y)
    @x_rules = @script.package.rules.where(xy: :rule_x)
    @pawns = @script.pawns.eager_load(:za, :position)
    @pawn = Pawn.new
    @pawn_1 = Pawn.find(1)
    @zas = Za.all
    @positions = @script.package.positions
    @incidents = @script.incidents.preload(:crime, pawn: :za)
    # @incidents = @script.incidents.preload(:crime, :pawn)
    # @incidents = @script.incidents
    @array = Array[nil]
    (1..@script.noof_days).each{|i| @array.push(@incidents.find_by(day: i))}
    @incident = Incident.new
    @incident_1 = Incident.find(1)
    @crimes = @script.package.crimes
    @weeks = [["１週", 1], ["２週", 2], ["３週", 3], ["４週", 4], ["５週", 5], ["６週", 6], ["７週", 7], ["８週", 8], ["９週", 9], ]
    @days = [["１日", 1], ["２日", 2], ["３日", 3], ["４日", 4], ["５日", 5], ["６日", 6], ["７日", 7], ["８日", 8], ["９日", 9], ]
    @packages = Package.all
    p "----------フィニッシュ----------"
  end

  def edit
  end

  def update
    @script = Script.find(params[:id])
    if @script.update(script_params)
      redirect_to @script
    else
      render :show
    end
  end

  def destroy
    @script = Script.find(params[:id])
    @script.destroy
    redirect_to scripts_path
  end

  private
  def script_params
    params.require(:script).permit(:name, :package_id, :noof_days, :noof_weeks)
  end
end
