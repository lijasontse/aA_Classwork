require 'colorize'
require_relative 'cursor.rb'
require_relative 'board.rb'

BOARD_COLOR = {
    :even => :grey,
    :odd => :black,
    :cursor => :red
}

class Display

    def initialize
        @board = Board.new
        @cursor = Cursor.new([0, 0], @board)
    end

    def display
        display = true
        while display
            system('clear')
            render
            @cursor.get_input
        end
    end

    def render
        @board.board.each_with_index do |row, i|
            puts
            row.each_with_index do |el, j|
                print el.to_s.center(3).colorize( :background => BOARD_COLOR[board_color_switcher(i, j)] )
            end
        end
    end
    

    def board_color_switcher(i, j)
        if @cursor.cursor_pos == [i, j]
            :cursor
        else
            case i % 2
            when 0
                case j % 2
                when 0
                    :even
                when 1
                    :odd
                end
            when 1
                case j % 2
                when 0
                    :odd
                when 1
                    :even
                end
            end
        end
    end


end
