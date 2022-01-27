class ScriptRuleContract < ApplicationRecord
  belongs_to :script
  belongs_to :rule
end
