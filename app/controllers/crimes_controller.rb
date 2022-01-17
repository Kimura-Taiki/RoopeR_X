class CrimesController < ApplicationController
  def index
    @crimes = Crime.all
    @crime = Crime.new
  end

  def new
  end

  def show
  end

  def edit
  end
end
