class Board < ApplicationRecord
  has_many :cards, dependent: :destroy

  class << self
    def board_create
      @board = Board.new
      @board.week = 1
      @board.day = 1
      if @board.save
        Card.add_area(board: @board, location: 1, za_id: 36)
        Card.add_area(board: @board, location: 2, za_id: 37)
        Card.add_area(board: @board, location: 3, za_id: 38)
        Card.add_area(board: @board, location: 4, za_id: 39)
        @board
      end
    end
  end
end
