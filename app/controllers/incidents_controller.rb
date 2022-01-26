class IncidentsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @incident = Incident.new(incident_params)
    @incident.script_id = params[:script_id].to_i
    if @incident.save
      redirect_to @incident.script
    else
      render "scripts/#{params[:script_id]}"
    end
  end

  def show
  end

  def edit
  end

  def update
    # p "パラむは"
    # p params
    @req = params.require(:incident)
    @incident = Incident.find(@req[:id])
    @incident.update(incident_params)
    redirect_to script_path(@incident.script)
  end

  def destroy
    # p "destroy"
    # p params
    # p params[:id]
    @incident = Incident.find(params[:id])
    # p @pawn
    @script = @incident.script
    @incident.destroy
    redirect_to @script
  end

  private
  def incident_params
    params.require(:incident).permit(:day, :script_id, :pawn_id, :crime_id)
    # params.permit(:day, :script_id, :pawn_id, :crime_id)
  end
end
