require_relative "robot_class"
require_relative "input_reader"

def robot_controller(robot,user_input)
    include Input_reader

    moving_robot = lambda {|command| robot.move(command[:direction],command[:length])} 

    if verify_user_input(user_input)
        split_user_input(user_input).each(&moving_robot)
        return true
    else return false
    end
end

