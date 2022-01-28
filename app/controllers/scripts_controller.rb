class ScriptsController < ApplicationController
  def index
    @scripts = Script.all
    @script = Script.new
    @packages = Package.all
    @y_rules = Package.find(1).rules.where(xy: :rule_y)
    @x_rules = Package.find(1).rules.where(xy: :rule_x)
    @rules = [@y_rules[0], @x_rules[0], @x_rules[1]]
    @weeks = [["１週", 1], ["２週", 2], ["３週", 3], ["４週", 4], ["５週", 5], ["６週", 6], ["７週", 7], ["８週", 8], ["９週", 9], ]
    @days = [["１日", 1], ["２日", 2], ["３日", 3], ["４日", 4], ["５日", 5], ["６日", 6], ["７日", 7], ["８日", 8], ["９日", 9], ]
  end

  def create
    @script = Script.new(script_params)
    if @script.save
      @id = @script.id
      @sr_c = ScriptRuleContract.new
      @sr_c.script_id = @id
      @sr_c.rule_id = params[:script][:rule_y].to_i
      @sr_c.save
      @sr_c = ScriptRuleContract.new
      @sr_c.script_id = @id
      @sr_c.rule_id = params[:script][:rule_x1].to_i
      @sr_c.save
      @sr_c = ScriptRuleContract.new
      @sr_c.script_id = @id
      @sr_c.rule_id = params[:script][:rule_x2].to_i
      @sr_c.save
      redirect_to scripts_path
    else
      render :index
    end
  end

  def show
    p "----------スタート----------"

    # タイトル系統
      # 脚本モデル本体
    @script = Script.find(params[:id])
      # ルール名一覧と役職名一覧を表示
    @rules = @script.rules.preload(:positions)
    @needs = include_positions(@rules)

    # @hash = Hash.new(0)
    # @needs.each {|key| @hash[key] += 1 }

    # @hash = @needs.inject(Hash.new(0)) {|h, key| h[key] +=1; h }

    # @hash = Hash.new(0)
    # @script.package.positions.each {|key| @hash[key] += 0 }
    # @needs.each {|key| @hash[key] += 1 }
    # @hash.each {|h| @hash[h[0]] = h[0].max if h[0].max < h[1] }
    @hash = position_deployment_const
    p "pは.         #{@hash}"

    # 脚本編集系統
      # 惨劇セットの指定に使う
    @packages = Package.all
      # ルールYとルールX、ルール指定に使う
    @y_rules = @script.package.rules.where(xy: :rule_y)
    @x_rules = @script.package.rules.where(xy: :rule_x)
      # 週数日数指定に使う
    @weeks = [["１週", 1], ["２週", 2], ["３週", 3], ["４週", 4], ["５週", 5], ["６週", 6], ["７週", 7], ["８週", 8], ["９週", 9], ]
    @days = [["１日", 1], ["２日", 2], ["３日", 3], ["４日", 4], ["５日", 5], ["６日", 6], ["７日", 7], ["８日", 8], ["９日", 9], ]

    # 駒編集系統
      # 脚本中の駒全てを表示
    @pawns = @script.pawns.eager_load(:za, :position)
      # 新規駒フォームのモデル属性
    @pawn = Pawn.new
      # 編集駒フォームのモデル属性
    @pawn_1 = Pawn.find(1)
      # 駒の座の指定に使う
    @zas = Za.all
      # 駒の役職の指定に使う
    @positions = @script.package.positions

    # 事件系統
      # 脚本中の事件全てを表示
    @incidents = @script.incidents.preload(:crime, pawn: :za)
      # 日程表、日程に応じてnilか事件モデルが入る
    @array = Array[nil]
    (1..@script.noof_days).each{|i| @array.push(@incidents.find_by(day: i))}
      # 新規事件フォームのモデル属性
    @incident = Incident.new
      # 編集事件フォームのモデル属性
    @incident_1 = Incident.find(1)
      # 事件の役職の指定に使う
    @crimes = @script.package.crimes
    p "----------フィニッシュ----------"
  end

  def edit
  end

  def update
    @script = Script.find(params[:id])
    if @script.update(script_params)
      update_script_rule_contracts
      p @script.rules
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

  def include_positions(rules)
    rules.inject([]) {|arr, r| r.positions.inject(arr) {|arr, p| arr.push(p)}}
  end

  def update_script_rule_contracts
    # inject云々以前に素直に代入すると、ActiveRecordが律儀に変わらないデータを削除しないのでルールY,X1,X2の順番が崩れる
    # しょうがないのでeachで処理する
    @script.rules = []
    id_params = [params[:script][:rule_y], params[:script][:rule_x1], params[:script][:rule_x2]]
    id_params.each {|id| @script.rules << Rule.find(id)}
  end

  def position_deployment_const
    z = @needs.inject(Hash.new(0)) {|h, key| h[key] +=1; h }.inject(Hash.new(0)) {|h, d| h[d[0]] +=[d[0].max, d[1]].min; h }
    z.store(Position.find(1), 99)
    z
  end
end
