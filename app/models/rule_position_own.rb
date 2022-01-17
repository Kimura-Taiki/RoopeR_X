class RulePositionOwn < ApplicationRecord
  belongs_to :rule
  belongs_to :position
end
