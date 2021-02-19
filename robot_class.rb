class Robot
    attr_reader :position
    def initialize(x,y)
        @position={x: x,y: y}
    end

    public
    def move(direction,length)
        case direction
            when "F"
                @position[:y] += length
             when "B"
                @position[:y] -= length
            when "R"
                @position[:x] += length
            when "L"
                @position[:x] -= length
            else puts "This direction is not valid"
        end
    end

    public
    def get_min_distance_to_zero
        @position[:x].abs+@position[:y].abs
    end

end