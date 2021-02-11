require_relative 'pieces.rb'

class Board

    attr_reader :board 
    

    STARTING_PIECES = [
        Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook 
    ]

    def initialize
        @board = Array.new(8) { Array.new(8) }
        populate_board
        assign_color
    end

    def populate_board
        @board.each_index do |i|
            if i == 0 || i == 7 
                (0..7).each do |j|
                    @board[i][j] = STARTING_PIECES[j].new([i,j], self)
                end
            elsif i == 1 || i == 6 
                @board[i] = @board[i].each_index.map { |j| Pawn.new([i, j], self) }
            else
                @board[i] = @board[i].each_index.map { |j| NullPiece.instance }
            end
        end
    end

    def assign_color
        @board.each_index do |i|
            if i == 0 || i == 1 
                @board[i].each { |piece| piece.color = :white } 
            elsif i == 6 || i == 7
                @board[i].each { |piece| piece.color = :black } 
            end
        end
    end


    def [](position)
        row, col = position
        @board[row][col]
    end

    def []=(position, piece)
        row, col = position
        @board[row][col] = piece
    end

    def valid_position?(pos)
        row, col = pos
        unless row.between?(0, 7) && col.between?(0, 7)
            # raise ArgumentError.new("Position out of bounds!")
            false
        else
            true
        end
    end

    def end_empty?(pos)
        unless self[pos].is_a?(NullPiece)
            # raise ArgumentError.new("Positon not empty!")
            false
        else
            true
        end
    end

    def start_empty?(pos)
        if self[pos].is_a?(NullPiece)
            # raise ArgumentError.new("Positon not empty!")
            false
        else
            true
        end
    end


    def move_piece(start_pos, end_pos)
        if move_piece_bool(start_pos, end_pos)
            self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
            self[end_pos].position = end_pos
            true
        else
            false
        end
    end

    def move_piece_bool(start_pos, end_pos)
        valid_moves = self[start_pos].moves
        boolean = [valid_position?(start_pos), start_empty?(start_pos),
            valid_position?(end_pos), end_empty?(end_pos),
            valid_moves.include?(end_pos) ].all? { |bool| bool == true }
        return boolean
    end

    def check_color(position)
        self[position].color unless self[position].is_a?(NullPiece)
    end

    def in_check?(color)
        king_pos = find_king(color)
        queue = []
        king = 
    end

    def find_king(color)
        @board.each_index do |i|
            @board[i].each_index do |j|
                pos = [i, j]
                piece = @board[i][j]
                if piece.class == King && piece.color != color
                    return pos
                end
            end
        end
    end

end

