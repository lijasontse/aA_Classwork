require_relative 'piece.rb'

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
        x, y = position
        @board[y][x]
    end

    def []=(position, piece)
        x, y = position
        @board[y][x] = piece
    end

    def valid_position(pos)
        x, y = pos
        unless x.between?(0, 7) && y.between?(0, 7)
            raise ArgumentError.new("Position out of bounds!")
            false
        end
        true
    end

    def end_empty?(pos)
        unless self[pos].is_a?(NullPiece)
            raise ArgumentError.new("Positon not empty!")
            false
        end
        true
    end

    def start_empty?(pos)
        if self[pos].is_a?(NullPiece)
            raise ArgumentError.new("Positon not empty!")
            false
        end
        true
    end


    def move_piece(start_pos, end_pos)
        if (valid_position(start_pos) && start_empty?(start_pos) &&
            valid_position(end_pos) && end_empty?(end_pos))
            self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
            true
        end
        false
    end

end

