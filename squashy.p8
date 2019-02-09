pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

-- player
lives=3
score=0

-- paddle
padx=52
pady=122
padw=24
padh=4
padspeed=4

-- ball
ballx=64
bally=64
ballsize=3
ballxdir=5
ballydir=-3

-- boxes
boxleft=10
boxtop=20

boxwidth=5
boxheight=5

xspace=2
yspace=2

xboxes=10
yboxes=5

mt = {}	-- create the matrix
for i=1,xboxes do
	mt[i] = {}	-- create a new row
	for j=1,yboxes do	-- populate rows with boxes
		mt[i][j] = 0
	end
end

function movepaddle()
 if btn(0) then
 	padx-=padspeed
 elseif btn(1) then
 	padx+=padspeed
 end
end

function moveball()
	ballx+=ballxdir
	bally+=ballydir
end

function bounceball()
	-- left
	if ballx<ballsize then
		ballxdir=-ballxdir
		sfx(0)
	end

	-- right
	if ballx>128-ballsize then
		ballxdir=-ballxdir
		sfx(0)
	end

	-- top
	if bally<ballsize then
		ballydir=-ballydir
		sfx(0)
	end
end

-- bounce the ball off the paddle
function bouncepaddle()
	if ballx>=padx and 
	ballx<=padx+padw and
	bally>pady then
		ballydir=-ballydir
		score+=10 -- increase the score on a hit!
		sfx(0)
	end
end

function losedeadball()
	if bally>128 then
		sfx(3)
		bally=24
		score=0
		lives-=1
	end
end

function drawbox(i,j)
	-- defines the bounds of each box
	topleft=boxleft+(i-1)*(boxwidth+xspace)
	botleft=boxtop+(j-1)*(boxheight+yspace)
	topright=topleft+boxwidth
	botright=botleft+boxwidth
	
	rectfill(topleft,botleft,topright,botright,15)
end

function drawboxes()
	for i=1,xboxes do
		for j=1,yboxes do
			if mt[i][j]==0 then
				drawbox(i,j)
			end
		end
	end
end

function _update()
	movepaddle()
	bounceball()
	bouncepaddle()
	moveball()
	losedeadball()
end

function _draw()
	-- clear the screen
	rectfill(0,0,128,128,3)

	-- draw the lives
	for i=1,lives do
		spr(001,90+i*8,4)
	end

	-- draw the score
	print(score,12,6,15)

	-- draw the boxes
	drawboxes()
	
	-- draw the paddle
	rectfill(padx,pady,padx+padw,pady+padh,15)

	-- draw the ball
	circfill(ballx,bally,ballsize,15)
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000ff0ff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700fffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000fffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770000fffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070000fff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
