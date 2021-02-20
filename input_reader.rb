=begin
    This module contains four function:
    verify_single_input(input): to verify input with format "F1" or "R" or "L3"
    split_single_input(input): split "R" or "F1" to a hash with two keys: direction and length
    verify_user_input(input): verify the user input with format "F1,R,L3,B5"
    split_user_input(input): split the user input to several single inputs
=end

module Input_reader
    def verify_single_input(input)
        unless (input.length == 2) && (["F","B","R","L"].include?(input[0])) && input[1].match?(/[[:digit:]]/)
            return true if (input.length == 1) && (["F","B","R","L"].include?(input))
            return false
        else return true
        end
    end

    def split_single_input(input)
        if (input.length == 1) && (["F","B","R","L"].include?(input))
            move_command = {direction: input[0], length: 1}
        else
            move_command = {direction: input[0], length: input[1].to_i}
        end
    end

    def verify_user_input(input)
        correctness = true
        command_array = input.split(",")
        command_array.each{|x| correctness =false unless verify_single_input(x)}
        return correctness
    end

    def split_user_input(input)
        command_array = input.split(",")
        command_array.map{|x| split_single_input(x)}
    end
end
