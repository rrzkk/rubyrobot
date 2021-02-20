=begin
    This is a robot class with position attribute and several other methods
=end

class Robot
    attr_reader :position
    def initialize(x,y,facing="N")
        @position={x: x,y: y,facing: facing}
    end

    public
    # To change the robot's positon, turn or move
    def move(direction,length)
        case direction
            when "F"
                @position[:y] += length if @position[:facing]=="N"
                @position[:x] += length if @position[:facing]=="E"
                @position[:y] -= length if @position[:facing]=="S"
                @position[:x] -= length if @position[:facing]=="W"
            when "B"
                @position[:y] -= length if @position[:facing]=="N"
                @position[:x] -= length if @position[:facing]=="E"
                @position[:y] += length if @position[:facing]=="S"
                @position[:x] += length if @position[:facing]=="W"
            when "R"
                facing_array=["N","E","S","W"]
                length.times{
                    @position[:facing] = turning(facing_array,@position[:facing])
                }
            when "L"
                facing_array=["N","W","S","E"]
                length.times{
                    @position[:facing] = turning(facing_array,@position[:facing])
                }
            else puts "This direction is not valid"
        end
    end

    # To get the minimum distance from the current position to the (0,0) point
    public
    def get_min_distance_to_zero
        return @position[:x].abs+@position[:y].abs 
    end

    # To get the minimum turns robot need to do to get back to (0,0)
    public
    def get_min_turns
        return facing_origin(@position)
    end

    # To get the next facing direction after turning command
    private
    def turning(facing_array,current_facing)
        next_facing=current_facing
        facing_array.each_with_index{|el,index| 
            next_facing = facing_array[(index+1)%4] if el == current_facing
        }
        return next_facing
    end

    # To find out the relation between facing direction and curren position, maybe used later for route calculation
    private
    def facing_origin(position)
        zero_step_1 = (position[:x] == 0) && (position[:facing] == "N") && (position[:y] <= 0)
        zero_step_2 = (position[:x] == 0) && (position[:facing] == "S") && (position[:y] >= 0)
        zero_step_3 = (position[:y] == 0) && (position[:facing] == "E") && (position[:x] <= 0)
        zero_step_4 = (position[:y] == 0) && (position[:facing] == "W") && (position[:x] >= 0)

        one_step_1 = (position[:x] > 0) && (position[:y] > 0) && (position[:facing] == "S"|| position[:facing] == "W")
        one_step_2 = (position[:x] > 0) && (position[:y] < 0) && (position[:facing] == "N"|| position[:facing] == "W")
        one_step_3 = (position[:x] < 0) && (position[:y] < 0) && (position[:facing] == "N"|| position[:facing] == "E")
        one_step_4 = (position[:x] < 0) && (position[:y] > 0) && (position[:facing] == "S"|| position[:facing] == "E")
        one_step_5 = (position[:x] == 0) && (position[:y] != 0) && (position[:facing] == "W" || position[:facing] == "E")
        one_step_6 = (position[:y] == 0) && (position[:x] != 0) && (position[:facing] == "N" || position[:facing] == "S")

        if zero_step_1 || zero_step_2 || zero_step_3 || zero_step_4
            return 0
        elsif one_step_1 || one_step_2 || one_step_3 || one_step_4 || one_step_5 ||one_step_6
            return 1
        else return 2
        end
    end
end