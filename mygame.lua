-- add newline to end of required functions
require("functions")
require("ball_collisions")
require("paddle")

_set_fps(60)

-- game state
dotMMO = false

function resetPaddle()
	-- player
	lives=3
	score=0

	-- paddle
	padx=52
	pady=122
	padw=100
	padh=20
	padspeed=4

	-- ball
	-- ballx=64
	-- bally=64
	-- ballsize=3
	-- ballxdir=5
	-- ballydir=-3

	-- boxes
	xboxes=12
	yboxes=5

	boxwidth=6
	boxheight=6

	xspace=2
	yspace=2

	ballx=64
	bally=64
	ballsize=2
	ballxdir=2
	ballydir=-3

	boxleft= (128 - xboxes*(boxwidth + xspace) + xspace) / 2
	boxtop=20

	mt = {}	-- create the matrix
	for i=1,xboxes do
		mt[i] = {}	-- create a new row
		for j=1,yboxes do	-- populate rows with boxes
			mt[i][j] = 0
		end
	end
end

function _update()
	if not dotMMO then
		runPaddle()
	end	
end

function _draw()
	-- clear the screen
	rectfill(0,0,128,128,3)

	if dotMMO then
		resetPaddle()
		dotMMO = false
	end

	-- if not dotMMO then
		drawPaddle()
	-- end


end