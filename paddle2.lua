-- player
lives=3
score=0

-- paddle
padx2=52
pady2=5
padw2=20
padh2=3
padspeed2=4

-- ball
-- ballx=64
-- bally=64
-- ballsize=3
-- ballxdir=5
-- ballydir=-3

function movepaddle2()
 if btn(0) then
	 padx2-=padspeed
end
 if btn(1) then
 	padx2+=padspeed
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


function runPaddle()
    movepaddle2()
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
    rectfill(padx2,pady,padx2+padw2,pady2+padh2,15)
end
