class PackageCrimeOwn < ApplicationRecord
  belongs_to :package
  belongs_to :crime
end
