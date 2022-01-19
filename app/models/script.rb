class Script < ApplicationRecord
  has_many :pawns
  has_many :incidents
  # has_many :script_rule_contracts
  # has_many :tragedies
  
  belongs_to :package
end
