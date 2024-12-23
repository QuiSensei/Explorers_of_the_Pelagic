
event_inherited()

// Determine the initial direction based on image_xscale or manually set facing
if (image_xscale == 1) { // Facing right
    direction = 180; // Fly to the right
} else if (image_xscale == -1) { // Facing left
    direction = 0; // Fly to the left
}

// Movement and wave properties
speed = 2;        
amplitude = 20;   
frequency = 0.1; 
ystart = y;         
timer = 0;         

name = "Yellow Warbler";
exam_range = 0;
