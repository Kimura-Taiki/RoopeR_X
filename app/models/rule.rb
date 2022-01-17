class Rule < ApplicationRecord
  has_many :rule_position_owns
  has_many :positions, through: :rule_position_owns
  
  enum xy: { rule_x: 1, rule_y: 2 }, _prefix: true
end

