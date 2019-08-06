class Game

    def initialize(secret)
        @secret = secret
    end

    def guess
        @guess = []
        i = 0
        4.times do
            print 'choose a color: '
            color = gets.chomp
            @guess << color
        end
        puts ''
    end

    def break
        i = 0
        correct = 0
        misplaced = 0
        while i < @secret.length
            if @secret[i] == @guess[i]
                correct += 1
            elsif @secret.any?(@guess[i])
                misplaced += 1
            end
            i += 1
        end

        if correct == 4
            puts "Code cracked! #{@secret}"
            return 'true'
        else
            puts "correct: #{correct} / misplaced: #{misplaced}"
        end
        puts ''
    end

    def comp_break(guess)
        i = 0
        correct = 0
        misplaced = 0
        while i < @secret.length
            if @secret[i] == guess[i]
                correct += 1
            elsif @secret.any?(guess[i])
                misplaced += 1
            end
            i += 1
        end

        if correct == 4
            puts "Code cracked by the computer! #{@secret}"
            return true
        else
            puts "correct: #{correct} / misplaced: #{misplaced}"
            c_m = [correct, misplaced]
            return c_m
        end
    end
    
end

class Computer

    def comp_guess
        colors = ['blue', 'red', 'yellow', 'green', 'purple', 'orange']
        @guess = []
        4.times do
            @guess << colors[rand(6)]
        end
        puts @guess
        puts ''
        return @guess
    end

    def guess_with_feedback(c, m)
        colors = ['blue', 'red', 'yellow', 'green', 'purple', 'orange']
        if c > 0 or m > 0
            retries = c + m
            new_guess = []
            retries.times do
                new_guess << @guess[rand(4)]
            end
            if retries < 4
                while new_guess.length < 4
                    new_guess << colors[rand(6)]
                end
            end
            @guess = new_guess
            puts @guess
            return @guess
        else
            self.comp_guess
        end
    end

end

puts 'Mastermind - Ruby Edition'
puts ''
puts 'Hello, individual. Choose what you want to play as:'
puts 'Cracker (1)   Coder (2)'

player_role = gets.chomp

colors = ['blue', 'red', 'yellow', 'green', 'purple', 'orange']

if player_role == '1'
    secret_code = []
    4.times do |color|
        secret_code << colors[rand(6)]
    end

    match = Game.new(secret_code)
    turns = 1

    while turns < 11
        match.guess
        cracked = match.break
        if cracked == 'true'
            turns = 11
        else
            turns += 1
        end

        if turns == 11
            puts 'game over'
        else
            remaining = 11 - turns
            puts "#{remaining} tries remaining"
            puts ''
        end
    end

elsif player_role == '2'
    secret_code = []
    puts 'create a code with 4 colors, choosing from the 6 colors available:'
    puts colors
    puts ''

    4.times do
        print 'choose a color: '
        color = gets.chomp
        secret_code << color
    end

    match = Game.new(secret_code)
    breaker = Computer.new
    turns = 1

    while turns < 11
        if turns < 2
            guess = breaker.comp_guess
            feedback = match.comp_break(guess)
        else
            guess = breaker.guess_with_feedback(feedback[0], feedback[1])
            puts ''
            feedback = match.comp_break(guess)
        end

        if feedback == 'true'
            turns == 11
        else
            turns += 1
        end

        if turns == 11
            puts 'game over'
        end
    end
end