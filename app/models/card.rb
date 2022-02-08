class Card < ApplicationRecord
  belongs_to :board
  belongs_to :za
  belongs_to :position

  enum status: { indefinite: 0, alive: 1, dead: 2, land: 3 }
  enum location: { waiting: 0, hospital: 1, shrine: 2, city: 3, school: 4, excluded: 5, godly_being: 6, henchman: 7, servant: 8 }
end
