class RulesController < ApplicationController
  def index_all
    @rules = Rule.all
    @rule = Rule.new
  end

  def index
  end

  def new
  end

  def show
  end

  def edit
  end
end
