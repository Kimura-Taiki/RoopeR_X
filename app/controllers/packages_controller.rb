class PackagesController < ApplicationController
  def index
    @packages = Package.all
    @package = Package.new
  end

  def new
  end

  def show
    @package = Package.find(params[:id])
  end

  def edit
  end
end
