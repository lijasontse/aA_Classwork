require 'byebug'
module Slideable

    def moves
        move_dirs.map { |dir| grow_unblocked_moves_in_dir(dir) }
    end

    private
    HORIZONTAL_DIRS = [[0, 1], [0, -1]]

    VERTICAL_DIRS = [[1, 0], [-1, 0]]

    DIAGONAL_DIRS = [[1, 1], [-1, -1]] 

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def vertical_dirs
        VERTICAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def move_dirs
        class_instance = self.class
        if class_instance == Rook
            return vertical_dirs + horizontal_dirs
        elsif class_instance == Bishop
            return diagonal_dirs
        elsif class_instance == Queen
            return vertical_dirs + horizontal_dirs + diagonal_dirs
        end   
    end
            # debugger
        # case self.class
        # when Rook
        #     return vertical_dirs + horizontal_dirs
        # when Bishop
        #     return diagonal_dirs
        # when Queen
        #     return vertical_dirs + horizontal_dirs + diagonal_dirs
        # end

    def grow_unblocked_moves_in_dir(dir)
        # debugger
        pos = @position.each_index.map{ |i| @position[i] + dir[i] }
        unblocked_pos = [pos]
        until (!@board.valid_position?(unblocked_pos.last) || 
            !@board.end_empty?(unblocked_pos.last))
            pos = pos.each_index.map { |i| pos[i] + dir[i] }
            unblocked_pos << pos
        end
        if unblocked_pos.last.color != color
            return unblocked_pos
        end
        unblocked_pos.pop
        return unblocked_pos
    end

end
