-- add newline to end of required functions
require("functions")
require("ball_collisions")
require("paddle")

_set_fps(60)

-- game state
dotMMO = false

function _update()
	if not dotMMO then
		runPaddle()
	end	
end

function _draw()
	-- clear the screen
	rectfill(0,0,128,128,3)

	if not dotMMO then
		drawPaddle()
	end


end