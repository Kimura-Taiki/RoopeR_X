class Rule < ApplicationRecord
  # has_many :package_rule_owns
  # has_many :packages, through: :package_rule_owns
  has_many :paruos
  has_many :packages, through: :paruos
  has_many :rule_position_owns
  has_many :positions, through: :rule_position_owns
  has_many :script_rule_contracts
  has_many :rules, through: :script_rule_contracts

  enum xy: { rule_y: 1, rule_x: 2 }, _prefix: true
end

