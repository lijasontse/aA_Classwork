require_relative '../piece.rb'
require_relative '../slideable.rb'

class Queen < Piece
    include Slideable
    def initialize(position, board)
        super
    end

    def color=(color)
        @symbol = ( self.color == :white ? '♛' : '♕' )
    end
end