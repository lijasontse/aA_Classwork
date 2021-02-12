class Hanoi

    def initialize
        @board = Array.new(3) {[]}
    end

    def board
        @board 
    end

    def board=(num)
        put "Enter amount of disks"
        @board[0] += (1..num).to_a
    end

    def get_input
      p "Enter position separated by a space like this ! '0 1'"
      pos = gets.chomp.split(" ").map {|i| i.to_i}
      if pos[0] > 2 || pos[1] > 2 
        raise "Invalid position, numbers must be less than or equal to 2"
      elsif pos[0] == pos[1]
        raise "Can't move a disk to where it is already"
      else
        return pos
      end
    end

    def move_to(pos)
        
        selected_pile = @board[pos[0]]
        put_to_pile = @board[pos[1]]
        put_to_pile.unshift(selected_pile.shift)
        
    end

    def valid_move(pos)
      selected_pos = pos[0]
      distination_pos = pos[1]
      
      if @board[distination_pos].empty?
        move_to(pos)
      else  
        if @board[selected_pos][0] < @board[distination_pos][0]
          move_to(pos)
        else
          raise "your disk is too big"
        end
      end
    end

    def win 
    end

    def play 
        board=()
        input = get_input
        valid_move(input)
    end




end

# !

