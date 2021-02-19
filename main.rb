require_relative "robot_controller"

robot=Robot.new(0,0)
puts "I am robot Vincent, I am at zero position now, please give me a command"
puts "`F` - move forward 1 unit"
puts "`B` - move backward 1 unit"
puts "`R` - turn right 90 degrees"
puts "`L` - turn left 90 degrees"
puts "Your command format should be like : F4,R2,B2,L3,B3 or F,R2,B2,L,B3"