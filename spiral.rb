class Spiral
    def initialize(screen_)
        @screen = screen_
        @step_counter = 1
        @direction = 0
        @current_steps = 1
        @turn_counter = 1
        @cx = (@screen.w / 2.0).to_i
        @cy = (@screen.h / 2.0).to_i
    end

    def prime?(num)
        return false if num == 1
        sqrt_num = Math.sqrt(num)
        for i in 2..sqrt_num
            return false if (num % i).zero?
        end
        return true;
    end

    def move
        @cx += 1 if @direction == 0
        @cy -= 1 if @direction == 1
        @cx -= 1 if @direction == 2
        @cy += 1 if @direction == 3
    end

    def turn
        @direction += 1
        @direction = 0 if @direction >= 4
    end

    def next_spiral_step
        pixel_val = prime?(@step_counter) ? @screen.pixel_full : @screen.pixel_empty
        @screen.set_pixel_at(@cx, @cy, pixel_val)
        move

        if @step_counter % @current_steps == 0
            turn
            @turn_counter += 1
            if @turn_counter % 2 == 0
                @current_steps += 1
            end
        end
        @step_counter += 1
    end
end