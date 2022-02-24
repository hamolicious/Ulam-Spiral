require_relative 'screen.rb'
require_relative 'spiral.rb'

screen = Screen.new(50, 50)
frame_rate = 1.0/30
spiral = Spiral.new(screen)

while true
    spiral.next_spiral_step
    screen.display
    sleep(frame_rate)
end


