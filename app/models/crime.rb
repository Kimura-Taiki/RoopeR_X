class Crime < ApplicationRecord
  
  enum counter: { paranoia: 0, intrigue: 1, dead: 2, goodwill: 3 }, _prefix: true
end
