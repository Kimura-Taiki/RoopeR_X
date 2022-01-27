class Scripts::RuleChangesController < ApplicationController
  def index
    p "RuleChangesControllerへ到着したぞー！"
    p params
    @y_rules = Package.find(params[:id]).rules.where(xy: :rule_y)
    @x_rules = Package.find(params[:id]).rules.where(xy: :rule_x)
    @json = {:rule_y => @y_rules, :rule_x => @x_rules}
    p @json
    respond_to do |format| # リクエスト形式によって処理を切り分ける
      format.html { redirect_to :root } # html形式の場合
      format.json { render json: @json } # json形式の場合
    end
  end
end
