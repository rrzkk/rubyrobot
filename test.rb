require_relative "robot_class"

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

robot_class_test