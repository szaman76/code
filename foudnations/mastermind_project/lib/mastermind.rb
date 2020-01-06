require_relative "code"

class Mastermind


    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(code)
        p "exact matches " + @secret_code.num_exact_matches(code).to_s
        p "near matches " + @secret_code.num_near_matches(code).to_s

    end

    def ask_user_for_guess
        print "'Enter a code'"
        arr = Code.from_string(gets.chomp)
        self.print_matches(arr)

        @secret_code == arr

    end
end
