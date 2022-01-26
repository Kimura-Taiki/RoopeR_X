class Pawn < ApplicationRecord
  has_many :incidents, dependent: :destroy

  belongs_to :script
  belongs_to :za
  belongs_to :position

  def name
    self.za.name
  end
end
