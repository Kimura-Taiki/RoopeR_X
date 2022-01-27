class Script < ApplicationRecord
  has_many :pawns, dependent: :destroy
  has_many :incidents, dependent: :destroy
  has_many :script_rule_contracts, dependent: :destroy
  has_many :rules, through: :script_rule_contracts
  # has_many :tragedies

  belongs_to :package
end
