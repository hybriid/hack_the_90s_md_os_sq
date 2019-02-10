ballx=64
bally=64
ballsize=2
ballxdir=2
ballydir=-3

function hitLeft(obj_x1, obj_y1, obj_x2, obj_y2)
	return ballx >= obj_x1 and ballx <= obj_x1 + 1 and
	bally >= obj_y1 and bally <= obj_y2
end

function hitRight(obj_x1, obj_y1, obj_x2, obj_y2)
	return ballx >= obj_x2 + 1 and ballx <= obj_x2 and
	bally >= obj_y1 and bally <= obj_y2
end

function hitTop(obj_x1, obj_y1, obj_x2, obj_y2)
	return ballx >= obj_x1 + 1 and ballx <= obj_x2 - 1 and
	bally >= obj_y1 and bally <= obj_y1 + 1
end

function hitBot(obj_x1, obj_y1, obj_x2, obj_y2)
	return ballx >= obj_x1 + 1 and ballx <= obj_x2 - 1 and
	bally >= obj_y2 - 1 and bally <= obj_y2
end

function is_collide(obj_x1, obj_y1, obj_x2, obj_y2)
	obj_x2 += 2

   	if ballx >= obj_x1 and ballx <= obj_x2 and
	  bally >= obj_y1 and bally <= obj_y2 then
	  	if ballx <= obj_x1 + ballxdir then
		  ballxdir = -ballxdir
		  return true
		elseif ballx >= obj_x2 - ballxdir then
			ballxdir = -ballxdir
			return true
		end
		return true
	end
	return false
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
	-- if ballx>=padx and 
	-- ballx<=padx+padw and
	-- bally>pady then

	if is_collide(padx,pady,padx+padw,pady+padh) then
		ballydir=-ballydir
		-- score+=10 -- increase the score on a hit!
		sfx(0)
	end
end

-- bounce the ball off the boxes
function bouncebox(x,y)
	for i=1,x do
		for j=1,y do
			if mt[i][j] == 0 then
				left=boxleft+(i-1)*(boxwidth+xspace)
				top=boxtop+(j-1)*(boxheight+yspace)
				right=left+boxwidth
				bot=top+boxwidth
				if is_collide(left,top,right,bot) then
					ballydir=-ballydir
					mt[i][j] = 1
					score += 1
					return;
				end
			end
		end
	end
end


function losedeadball()
	if bally>128 then
		sfx(3)
		bally=24
		lives-=1
	end
end
