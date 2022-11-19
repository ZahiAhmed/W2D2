class GuessingGame
    def initialize(min, max)
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end

    def num_attempts
        @num_attempts
    end
    
    def game_over?
        @game_over
    end
    
    def check_num(num)
        @num_attempts += 1
        if num == @secret_num
            @game_over = true
            puts "you win"
        end
        puts "too big" if num > @secret_num
        puts "too small" if num < @secret_num
    end

    def ask_user
        puts "enter a number"
        number = gets.chomp.to_i
        self.check_num(number)
    end
end
