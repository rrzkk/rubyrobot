require_relative "robot_class"
require_relative "input_reader"

def robot_class_test
    test_robot=Robot.new(0,0)
    puts (test_robot != nil)? "Successfully initiate the robot": "Cannot initiate the robot"
    test_robot.move("F",1)
    test_robot.move("B",2)
    test_robot.move("R",1)
    test_robot.move("L",2)
    puts (test_robot.position == {x: -1,y: -1})? "Successfully move to right place": "Fail to move to right place"
    puts (test_robot.get_min_distance_to_zero == 2)? "Successfully calculate the distance": "Fail to calculate the distance"
end

def input_reader_test
    include Input_reader
    if !verify_input("FFgt") && verify_input("F2") && !verify_input("BB") && !verify_input("B") && !verify_input("C2")
        puts "Successfully verify the input"
    end

    split_result = split_input("F2")
    if (split_result[:direction] == "F") && (split_result[:length] == 2)
        puts "Succesfully split the input"
    end
end

robot_class_test
input_reader_test