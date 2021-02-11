require 'singleton'

class Piece

    attr_accessor :position
    attr_reader :symbol, :color

    def initialize(position, board)
        @position = position
        @board = board
        @symbol = nil
        @color = nil
    end

    def color=(color)
        @color = color
    end

    def moves

    end

    def inspect
        if self.is_a?(NullPiece)
            @symbol.inspect
        else
            @symbol.inspect
        end
    end

    def to_s
        @symbol.to_s
    end

end












