class Game

    def initialize(p1, p2)
        @p1 = p1
        @p2 = p2
        @line_1 = ['1', '2', '3']
        @line_2 = ['4', '5', '6']
        @line_3 = ['7', '8', '9']
        @mark = 'X'
        @turn_count = 0
    end

    def whose_turn
        if @mark == 'X'
            puts "Now it\'s #{@p2}\'s turn."
            @mark = 'O'
        else
            puts "Now it\'s #{@p1}\'s turn."
            @mark = 'X'
        end
        puts ''
    end

    def input(x)
        if x >= 1 and x <= 3 and @line_1[x - 1] == x.to_s
            @line_1[x - 1] = @mark
        elsif x >= 4 and x <= 6  and @line_2[x - 4] == x.to_s
            @line_2[x - 4] = @mark
        elsif x >= 7 and x <= 9 and @line_3[x - 7] == x.to_s
            @line_3[x - 7] = @mark
        else
            puts "You have to input a valid position."
            new_x = gets.chomp
            new_x = new_x.to_i
            self.input(new_x)
        end
        @turn_count += 1
    end

    def show_table
        print @line_1
        puts ''
        print @line_2
        puts ''
        print @line_3
        puts ''
    end

    def victory_check
        if @turn_count >= 5
            if @line_1[0] == @line_1[1] and @line_1[1] == @line_1[2]
                if @line_1[0] == 'X'
                    puts "Winner: #{@p1}"
                    return 1
                else
                    puts "Winner: #{@p2}"
                    return 1
                end
            elsif @line_2[0] == @line_2[1] and @line_2[1] == @line_2[2]
                if @line_2[0] == 'X'
                    puts "Winner: #{@p1}"
                    return 1
                else
                    puts "Winner: #{@p2}"
                    return 1
                end
            elsif @line_3[0] == @line_3[1] and @line_3[1] == @line_3[2]
                if @line_3[0] == 'X'
                    puts "Winner: #{@p1}"
                    return 1
                else
                    puts "Winner: #{@p2}"
                    return 1
                end
            elsif @line_1[0] == @line_2[0] and @line_2[0] == @line_3[0]
                if @line_1[0] == 'X'
                    puts "Winner: #{@p1}"
                    return 1
                else
                    puts "Winner: #{@p2}"
                    return 1
                end
            elsif @line_1[1] == @line_2[1] and @line_2[1] == @line_3[1]
                if @line_1[1] == 'X'
                    puts "Winner: #{@p1}"
                    return 1
                else
                    puts "Winner: #{@p2}"
                    return 1
                end
            elsif @line_1[2] == @line_2[2] and @line_2[2] == @line_3[2]
                if @line_1[2] == 'X'
                    puts "Winner: #{@p1}"
                    return 1
                else
                    puts "Winner: #{@p2}"
                    return 1
                end
            elsif @line_1[0] == @line_2[1] and @line_2[1] == @line_3[2]
                if @line_1[0] == 'X'
                    puts "Winner: #{@p1}"
                    return 1
                else
                    puts "Winner: #{@p2}"
                    return 1
                end
            elsif @line_1[2] == @line_2[1] and @line_2[1] == @line_3[0]
                if @line_1[2] == 'X'
                    puts "Winner: #{@p1}"
                    return 1
                else
                    puts "Winner: #{@p2}"
                    return 1
                end
            elsif @turn_count == 9
                puts "It is a draw."
                return 1
            end
        end
    end

end

print "Name for player 1: "
player_1 = gets.chomp
print "Name for player 2: "
player_2 = gets.chomp

playing = true
match = Game.new(player_1, player_2)

puts 'Tic-Tac-Toe - Ruby GUIless Edition'
puts ''
puts 'The game always starts with the first player marking X and the second marking 0 on the table.'
puts 'Have fun.'
puts ''
puts "#{player_1}, choose a position on the table."
puts ''
match.show_table
puts ''

while playing

    play = gets.chomp
    puts ''
    play = play.to_i
    match.input(play)
    match.show_table
    puts ''
    if match.victory_check == 1
        playing = false
    else
        match.whose_turn
    end

end
