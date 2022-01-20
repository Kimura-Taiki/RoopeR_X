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

  private
  def incident_params
    # params.require(:incident).permit(:day, :script_id, :pawn_id, :crime_id)
    params.permit(:day, :script_id, :pawn_id, :crime_id)
  end
end
