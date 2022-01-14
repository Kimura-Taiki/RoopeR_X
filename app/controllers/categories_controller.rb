class CategoriesController < ApplicationController
  require 'csv' # ←忘れがちのため要注意

  def index
    @categories = Category.all
    @category = Category.new
  end

  def new
    @categories = Category.all
    respond_to do |fm|
      fm.html
      fm.csv do |csv|
        send_categories_csv(@categories)
      end
    end
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render :index
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

  def send_categories_csv(categories)
    csv_data = CSV.generate do |csv|
      column_names = %w(名称)
      csv << column_names
      categories.each do |c|
        column_values = [
          c.name,
        ]
        csv << column_values
      end
    end
    send_data(csv_data, filename: "分類の一覧.csv")
  end
end
