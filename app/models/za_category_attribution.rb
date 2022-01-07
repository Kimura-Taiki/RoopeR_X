class ZaCategoryAttribution < ApplicationRecord
  belongs_to :za
  belongs_to :category
  
  validates :za_id, uniqueness: { scope: :category_id }  #ここを追加
  
end
