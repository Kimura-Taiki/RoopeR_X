class Crime < ApplicationRecord
  has_many :package_crime_owns
  has_many :packages, through: :package_crime_owns
  has_many :incidents
  
  enum counter: { paranoia: 0, intrigue: 1, dead: 2, goodwill: 3 }, _prefix: true
end
