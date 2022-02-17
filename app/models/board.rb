class Board < ApplicationRecord
  has_many :cards, dependent: :destroy

  class << self
    def board_create
      @board = Board.new
      @board.week = 1
      @board.day = 1
      if @board.save
        Card.add_area(board: @board, area_id: 1, za_id: 36)
        Card.add_area(board: @board, area_id: 2, za_id: 37)
        Card.add_area(board: @board, area_id: 3, za_id: 38)
        Card.add_area(board: @board, area_id: 4, za_id: 39)
        @board
      end
    end
  end
end
