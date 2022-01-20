class Pawn < ApplicationRecord
  has_many :incidents

  belongs_to :script
  belongs_to :za
  belongs_to :position

  def pawn_name
    self.za.name
  end
end
