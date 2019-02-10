
-- player
lives=3
score=0

-- paddle
padx=52
pady=122
padw=20
padh=3
padspeed=4
padcolour=15


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

boxleft= (128 - xboxes*(boxwidth + xspace) + xspace) / 2
boxtop=20

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
end
 if btn(1) then
 	padx+=padspeed
 end
 if btn(2) then
	 pady-=padspeed
end
	if btn(3) then
		pady +=padspeed
	end
	if pady <= 0 then
        dotMMO = true
	end
end

function moveball()
	ballx+=ballxdir
	bally+=ballydir
end

function drawbox(i,j)
	-- defines the bounds of each box
	left=boxleft+(i-1)*(boxwidth+xspace)
	top=boxtop+(j-1)*(boxheight+yspace)
	right=left+boxwidth
	bot=top+boxwidth
	
	rectfill(left,top,right,bot,15)
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

function runPaddle()
    movepaddle()
	bounceball()
	bouncepaddle()
	bouncebox(xboxes,yboxes)
	moveball()
    losedeadball()
end

function drawPaddle()
    		-- draw the lives
		for i=1,lives do
        spr(001,90+i*8,4)
    end
    -- draw the score
    print(score,12,6,15)

    -- draw the boxes
    drawboxes()
    
    -- draw the paddle
    if padw > 99 then
        padcolour += 1
    end
    rectfill(padx,pady,padx+padw,pady+padh,padcolour)

    -- draw the ball
    circfill(ballx,bally,ballsize,15)
end
