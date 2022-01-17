class Rule < ApplicationRecord
  has_many :package_rule_owns
  has_many :packages, through: :package_rule_owns
  has_many :rule_position_owns
  has_many :positions, through: :rule_position_owns
  
  enum xy: { rule_y: 1, rule_x: 2 }, _prefix: true
end

