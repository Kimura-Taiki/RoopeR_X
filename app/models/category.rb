class Category < ApplicationRecord
  has_many :za_category_attributions
  has_many :zas, through: :za_category_attributions

end
