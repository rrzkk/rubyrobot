## Ruby Robot

This is a CLI application to parse commands and display the result.

You have a robot that can receive commands in order to move it.  These commands will tell the robot to go forwards or backwards, and turn left or right.  These commands will be  in the format <command><number>.  For example 'L1' means 'turn left by 90 degrees once'.  'B2' would mean go backwards 2 units.

### Inputs:
* `F` - move forward 1 unit
* `B` - move backward 1 unit
* `R` - turn right 90 degrees
* `L` - turn left 90 degrees
* `F,R,B2,L1,B3` - move forward 1 unit, turn right, go back two units, turn left, moving back 

### Outputs:
*  The minimum amount of distance to get back to the starting point
*  The minimum turns need to take to get back to the starting point
*  Wrong input notification

### How to run and test?
* Run
    ```bash
    ruby main.rb
    ```
* Test 
    ```bash
    ruby unit_test.rb
    ```

### Project Structure:
* main entry: main.rb
* test file: unit_test.rb
* class declarition: robot_class.rb
* user input API: input_reader.rb
* controller: robot_controller.rb
