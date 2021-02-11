require_relative '../piece.rb'
require_relative '../stepable.rb'

class King < Piece
    include Stepable
    def initialize(position, board)
        super 
    end

    def color=(color)
        @color = color
        @symbol = ( self.color == :white ? '♚' : '♔' )
    end

    def moves
        moves = moves_diffs.map do |move_diff|
            [move_diff[0] + @position[0], move_diff[1] + @position[1]]
        end
        valid_moves = moves.keep_if do |pos|
            @board.valid_position?(pos)
        end
        valid_moves
    end
end