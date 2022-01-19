class Incident < ApplicationRecord
  belongs_to :script
  belongs_to :pawn
  belongs_to :crime
end
