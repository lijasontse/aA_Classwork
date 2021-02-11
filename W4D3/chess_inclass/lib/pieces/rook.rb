require_relative '../piece.rb'
require_relative '../slideable.rb'

class Rook < Piece
    include Slideable
    def initialize(position, board)
        super
    end

    def color=(color)
        super(color)
        @symbol = ( self.color == :white ? '♜' : '♖' )
    end
end