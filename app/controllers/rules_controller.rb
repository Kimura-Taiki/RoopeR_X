class RulesController < ApplicationController
  def index_all
    @rules = Rule.all
    @rule = Rule.new
  end

  def index
    p "----スタート----"
    @package =Package.find(params[:package_id])
    @y_rules = @package.rules.where(xy: :rule_y).preload(:positions)
    @x_rules = @package.rules.where(xy: :rule_x).preload(:positions)
    # @rules = @package.rules
    # p "@rulesは  #{@rules.class}"
    # p "親クラスは  #{@rules.superclass}"
    # p "ancestorsは  #{@rules.ancestors}"
    p "----フィニッシュ----"
  end

  def new
  end

  def show
  end

  def edit
  end
end
