require_relative '../piece.rb'
require_relative '../stepable.rb'


class Knight < Piece
    include Stepable
    def initialize(position, board)
        super

    end

    def color=(color)
        super(color)
        @symbol = ( self.color == :white ? '♞' : '♘' )
    end
end