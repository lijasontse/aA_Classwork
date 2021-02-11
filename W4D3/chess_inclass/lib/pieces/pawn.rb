require_relative '../piece.rb'

class Pawn < Piece
    def initialize(position, board)
        super
    end

    def color=(color)
        super
        @symbol = ( self.color == :white ? '♟' : '♙' )
    end

    def moves
        pos = @position
        vertical_moves = forward_steps.map do |forward| 
            [pos.first + forward, pos.last]
        end
        vertical_moves = parse_vert_moves(vertical_moves)
        if side_attacks.nil?
            vertical_moves
        else
            vertical_moves + side_attacks
        end
    end

    # private
    def at_start_row?
        if self.color == :white && @position[0] == 1
            true
        elsif  self.color == :black && @position[0] == 6
            true
        else
            false
        end
    end

    def forward_dir
        if self.color == :white
            return 1
        else
            return -1
        end
    end

    def forward_steps
        if at_start_row?
            [forward_dir, forward_dir * 2]
        else
            [forward_dir]
        end
    end

    def side_attacks
        pos = @position
        diagonals = [[forward_dir, forward_dir], [forward_dir, forward_dir * -1]]
        diagonals = diagonals.map do |diag_dir|
             diag_dir.each_index.map { |i| diag_dir[i] + pos[i] }
        end
        diagonals = parse_diag_moves(diagonals)
        unless diagonals.empty?
            diagonals
        end
    end

    def parse_diag_moves(arr)
        arr.keep_if do |pos|
             ((@board.check_color(pos) || self.color) != self.color && 
             @board.valid_position?(pos))
        end
    end

    def parse_vert_moves(arr)
        arr.keep_if do |pos|
            @board.valid_position?(pos) && @board.end_empty?(pos)
        end
    end

end
