class Card < ApplicationRecord
  belongs_to :board
  belongs_to :za
  belongs_to :position

  enum location: { waiting: 0, hospital: 1, shrine: 2, city: 3, school: 4, excluded: 5 }
end
