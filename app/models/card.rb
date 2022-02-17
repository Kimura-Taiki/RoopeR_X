class Card < ApplicationRecord
  belongs_to :board
  belongs_to :za
  belongs_to :position
  belongs_to :first_area, class_name: "Area"
  belongs_to :current_area, class_name: "Area"

  enum status: { indefinite: 0, alive: 1, dead: 2, land: 3 }
  # enum location: { waiting: 0, hospital: 1, shrine: 2, city: 3, school: 4, excluded: 5, godly_being: 6, henchman: 7, servant: 8 }

  def first_location_name
    self.first_area.yml_i18n
  end

  def current_location_name
    self.current_area.yml_i18n
  end

  def paranoia_limit
    self.za.paranoia_limit
  end

  class << self
    def add_area(board: false, area_id: false, za_id: false)
      _card = board.cards.build
      _card.first_area_id = area_id
      _card.current_area_id = area_id
      _card.position_id = 51
      _card.za_id = za_id
      _card.save
      _card
    end
  end
end
