class ZasController < ApplicationController
  def index
    @zas = Za.all
    @za = Za.new
  end

  def new
  end

  def create
    p "クリエイトへ来たぞー"
    @c1 = params.require(:za)[:category1].to_i
    @c2 = params.require(:za)[:category2].to_i
    p @c1
    p @c2
    @za = Za.new(za_params)
    if @za.save
      if @c1 != 0
        @zc_a = ZaCategoryAttribution.new
        @zc_a.za_id = @za.id
        @zc_a.category_id = @c1
        @zc_a.save
      end
      if @c2 != 0
        @zc_a = ZaCategoryAttribution.new
        @zc_a.za_id = @za.id
        @zc_a.category_id = @c2
        @zc_a.save
      end
      redirect_to zas_path
    else
      render :index
    end
  end

  def show
  end

  def editst 
  end

  def update
  end

  def destroy
  end

  private
  def za_params
    params.require(:za).permit(:name, :paranoia_limit, :image)
  end
end
