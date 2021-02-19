require_relative "robot_class"
require_relative "input_reader"
require_relative "robot_controller"

def robot_class_test
    test_robot=Robot.new(0,0)
    puts (test_robot != nil)? "Successfully initiate the robot": "Fail to initiate the robot"
    test_robot.move("F",1)
    test_robot.move("B",2)
    test_robot.move("R",1)
    test_robot.move("L",2)
    puts (test_robot.position == {x: 0,y: -1, facing: "W"})? "Successfully move to the right place": "Fail to move to right place"
    puts test_robot.get_min_distance_to_zero
    puts (test_robot.get_min_distance_to_zero == 2)? "Successfully calculate the distance": "Fail to calculate the distance"
end

def input_reader_test
    include Input_reader
    if !verify_single_input("FFgt") && verify_single_input("F2") && !verify_single_input("BB") && verify_single_input("B") && !verify_single_input("C2")
        puts "Successfully verify the single input"
    else puts "Fail to verify the single input"
    end

    split_result = split_single_input("F2")
    if (split_result[:direction] == "F") && (split_result[:length] == 2)
        puts "Successfully split the single input"
    else puts "Fail to split the single input"
    end

    if verify_user_input("F2,F3,B3,R2,L") && verify_user_input("F2") && !verify_user_input("F2,F33,B3,R2,L")
        puts "Successfully verify the user input"
    else puts "Fail to verify the user input"
    end

    puts "Successfully split the user input" if split_user_input("F2,F3,B3,R2,L")[2] == {:direction=>"B", :length=>3}
end

def robot_controller_test
    test_robot=Robot.new(0,0)
    robot_controller(test_robot,"F2,F3,B,R2,L")
    puts (test_robot.position[:x]==0 && test_robot.position[:y]==4)? "Succesfully control the robot": "Fail to control the robot"
end



robot_class_test
input_reader_test
robot_controller_test