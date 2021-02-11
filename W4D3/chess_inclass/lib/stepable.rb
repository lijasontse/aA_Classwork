
module Stepable



    private
    KING_DIRS = [
        [-1, -1], [-1, 1], [1, 1], [1, -1], 
        [1, 0], [0, 1] [-1, 0], [0, -1]
    ]

    KNIGHT_DIRS = [
        [2, 1], [-2, -1], [-2, 1], [2, -1],
        [1, 2], [-1, -2], [-1, 2], [-1, 2]
    ]

    def king_dirs
        KING_DIRS
    end

    def knight_dirs
        KNIGHT_DIRS
    end

    def move_diffs
        class_instance = self.class
        if class_instance == King
            king_dirs
        elsif class_instance == Knight
            knight_dirs
        end
    end
    
end
