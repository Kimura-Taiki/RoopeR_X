class PackageRuleOwn < ApplicationRecord
  belongs_to :package
  belongs_to :rule
end
