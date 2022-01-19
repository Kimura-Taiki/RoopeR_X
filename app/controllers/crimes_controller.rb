class CrimesController < ApplicationController
  def index_all
    @crimes = Crime.all
    @crime = Crime.new
  end

  def index
    @package = Package.find(params[:package_id])
    @crimes = @package.crimes
  end

  def new
  end

  def show
  end

  def edit
  end
end
