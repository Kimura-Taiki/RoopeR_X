class IncidentsController < ApplicationController
  def index
  end

  def new
    @incident = Incident.new(incident_params)
    @incident.script_id = params[:script_id].to_i
    
    @pawn = Pawn.new(pawn_params)
    @pawn.script_id = params[:script_id].to_i
    @pawn.position_id = 1
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
  def incident_params
    params.require(:incident).permit(:day, :script_id, :pawn_id, :crime_id)
  end
end
