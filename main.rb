# Run this script in command line
require_relative "robot_controller"

robot=Robot.new(0,0)
puts "I am robot Vincent, I am at zero position now, please give me a command to reach desitination"
puts "`F` - move forward 1 unit"
puts "`B` - move backward 1 unit"
puts "`R` - turn right 90 degrees"
puts "`L` - turn left 90 degrees"
puts "Your command format should be like : F4,R2,B2,L3,B3 or F,R2,B2,L,B3"
# Allow users to check the input and re-input the command
loop do 
    moving_command = gets.chomp
    result = robot_controller(robot,moving_command)
    if result
        puts  "Do you want another move? Y/N?"
        another_move = "N"
        # Allow users to run the command several times
        loop do
            another_move = gets.chomp
            break if another_move == "N" || another_move == "Y" 
            puts "I did not understand"
        end
        break if another_move == "N" 
        puts "let's do it again! Please give me a command"
    else puts "Wrong format, Please try again"
    end
end
