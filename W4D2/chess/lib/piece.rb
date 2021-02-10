require 'singleton'

module Slideable

    HORIZONTAL_DIRS = [
        
        [[0, 0], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7]],
        [[0, 0], [0, -1], [0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7]]

    ]

    VERTICAL_DIRS = [
        [[0, 0], [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0]]
        [[0, 0], [-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0]]
    ]

    DIAGONAL_DIRS = [
        
    ]

    def horizontal_dirs

    end

    def diagonal_dirs

    end

end

module Stepable
end


class Piece

    attr_accessor :color, :board, :position

    def initialize(position, board)
        @position = position
        @board = board
        @color = nil
    end

    # def moves

    # end

    def inspect
        if self.is_a?(NullPiece)
            @symbol.inspect
        else
            @symbol.inspect
        end
    end


end

class Rook < Piece
    def initialize(position, board)
        super
        @symbol = ( self.color == :white ? '♜' : '♖' )
    end
end

class Knight < Piece
    def initialize(position, board)
        super
        @symbol = ( self.color == :white ? '♞' : '♘' )
    end
end

class Bishop < Piece
    def initialize(position, board)
        super
        @symbol = ( self.color == :white ? '♗' : '♝' )
    end
end

class Queen < Piece
    def initialize(position, board)
        super
        @symbol = ( self.color == :white ? '♛' : '♕' )
    end
end

class King < Piece
    def initialize(position, board)
        super
        @symbol = ( self.color == :white ? '♚' : '♔' )
    end
end

class Pawn < Piece
    def initialize(position, board)
        super
        @symbol = ( self.color == :white ? '♟' : '♙' )
    end
end

class NullPiece < Piece
    include Singleton

    attr_reader :color, :symbol

    def initialize
        @color = nil
        @symbol = nil
    end
end