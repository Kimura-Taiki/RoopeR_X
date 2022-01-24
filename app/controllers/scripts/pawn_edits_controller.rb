class Scripts::PawnEditsController < ApplicationController
  def index
    p "PawnEditsControllerへ到着したぞー！"
    p params
    @pawn = Pawn.find(params[:id])
    p @pawn
    respond_to do |format| # リクエスト形式によって処理を切り分ける
      format.html { redirect_to :root } # html形式の場合
      format.json { render json: @pawn } # json形式の場合
    end
  end
end
