/// @description Insert description here
// You can write your code in this editor
var hover = position_meeting(mouse_x, mouse_y, id) && clickable;
hover_lerp = lerp(hover_lerp, hover, 0.2);

image_xscale = lerp(normal_scale, hover_scale, hover_lerp);
image_yscale = image_xscale;

// Optional: Add subtle floating animation
y = y_start + sin(current_time/1000) * 2;