class RulesController < ApplicationController
  def index
    @rules = Rule.all
    @rule = Rule.new
  end

  def new
  end

  def show
  end

  def edit
  end
end
