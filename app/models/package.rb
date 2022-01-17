class Package < ApplicationRecord
  has_many :package_rule_owns
  has_many :rules, through: :package_rule_owns
  has_many :package_position_owns
  has_many :positions, through: :package_position_owns
  has_many :package_crime_owns
  has_many :crimes, through: :package_crime_owns
end
