var depth_deviation = y - preferred_depth;

// Depth correction (first check)
if (abs(depth_deviation) > depth_tolerance) {
    y -= sign(depth_deviation) * 0.5; // Direct depth correction
}

direction_change_timer++;
if (direction_change_timer >= direction_change_interval) {
    movement_direction *= -1;  // Flip direction
    direction_change_timer = 0;
    
    // Update image angle smoothly
    image_angle = (movement_direction > 0) ? 0 : 180;
}

var move_x = movement_direction * max_spd;
var move_y = lengthdir_y(max_spd, image_angle);

// Depth-based vertical movement adjustment
if (abs(depth_deviation) > depth_tolerance) {
    move_y += -sign(depth_deviation) * accel;
}

x += move_x;
y += move_y;

// Y-scale flip (only need to do this once)
var ang = ((image_angle % 360) + 360) % 360;
image_yscale = yscale * ((ang > 90 && ang < 270) ? -1 : 1);

event_inherited();