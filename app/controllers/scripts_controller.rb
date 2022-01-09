class ScriptsController < ApplicationController
  def index
    @scripts = Script.all
    @script = Script.new
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
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def script_params
    params.require(:script).permit(:name, :noof_days, :noof_weeks)
  end
end
