module Input_reader
    def verify_input(input)
        unless (input.length == 2) && (["F","B","R","L"].include?(input[0])) && input[1].match?(/[[:digit:]]/)
            return false
        else return true
        end
    end

    def split_input(input)
        move_command = {direction: input[0], length: input[1].to_i}
    end
end
