ball_x=64
ball_y=64
ball_radius=3
ball_x_dir=5
ball_y_dir=-3

function is_collide(
    obj_x1, obj_y1,
    obj_x2, obj_y2,
)

    if ball_x + ball_radius > obj_x1 and
       ball_x + ball_radius < obj_x2 then
        return true
    end

    elseif ball_x - ball_radius > obj_x1 and
       ball_x - ball_radius < obj_x2 then
        return true
    end

    elseif ball_y + ball_radius > obj_y1 and
       ball_y + ball_radius < obj_y2 then
        return true
    end

    elseif ball_y - ball_radius > obj_y1 and
       ball_y - ball_radius < obj_y2 then
        return true
    end

    return false

end