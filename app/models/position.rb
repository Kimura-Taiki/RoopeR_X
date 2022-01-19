class Position < ApplicationRecord
  has_many :package_position_owns
  has_many :packages, through: :package_position_owns
  has_many :rule_position_owns
  has_many :rules, through: :rule_position_owns
  has_many :pawns
  
  enum refusal: { neg: 0, optional: 1, mandatory: 2, puppet: 3 }, _prefix: true
  enum unkillable: { neg: 0, undead: 1 }, _prefix: true
  enum obstinate: { neg: 0, sinner: 1 }, _prefix: true
end
