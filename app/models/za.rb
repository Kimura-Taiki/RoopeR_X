class Za < ApplicationRecord
  # has_many :abilities
  has_many :za_category_attributions
  has_many :categories, through: :za_category_attributions
  # has_many :chara

  attachment :image
end
