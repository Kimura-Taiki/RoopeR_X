class CrimesController < ApplicationController
  def index_all
    @crimes = Crime.all
    @crime = Crime.new
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
