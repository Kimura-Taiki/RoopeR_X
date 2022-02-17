class Area < ApplicationRecord
  enum yml: { hospital: 1, shrine: 2, city: 3, school: 4, waiting: 5, excluded: 6 }
end
