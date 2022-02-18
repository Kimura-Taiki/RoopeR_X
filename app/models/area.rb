class Area < ApplicationRecord
  has_many :zas
  has_many :first_areas, class_name: "Card", foreign_key: "first_area_id"
  has_many :current_areas, class_name: "Card", foreign_key: "current_area_id"

  class << self
    def location_name(id)
      Area.ymls_i18n[Area.ymls.key(id)]
    end
  end

  enum yml: { hospital: 1, shrine: 2, city: 3, school: 4, waiting: 5, excluded: 6 }
end
