class Scripts::IncidentEditsController < ApplicationController
  def index
    p "IncidentEditsControllerへ到着したぞー！"
    p params
    @incident = Incident.find(params[:id])
    p @incident
    respond_to do |format| # リクエスト形式によって処理を切り分ける
      format.html { redirect_to :root } # html形式の場合
      format.json { render json: @incident } # json形式の場合
    end
  end
end
