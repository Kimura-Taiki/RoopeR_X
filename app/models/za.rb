class Za < ApplicationRecord
  # has_many :abilities
  has_many :za_category_attributions
  has_many :categories, through: :za_category_attributions
  # has_many :chara
  has_many :pawns

  attachment :image

  enum first_location: { waiting: 0, hospital: 1, shrine: 2, city: 3, school: 4, excluded: 5 }
  # enum position_condition: { no_condition: 0, person_required: 1 }
  # enum extra_argument: {
  #   no_argument: 0, mystery_boy: 1, godly_being: 2, boss: 3, henchman: 4, scientist: 5, transfer_student: 6, copy_cat: 7, servant: 8
  # }
end
