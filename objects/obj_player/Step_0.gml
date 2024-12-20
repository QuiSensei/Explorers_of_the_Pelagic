sm_update(sm);

#region movement
x += hsp;
y += vsp;

image_angle = hsp*2;
if(sign(hsp)!=0)
	image_xscale = sign(hsp);

if(x < 0){
	x = 0;
	hsp *= -1;
}
if(x > room_width){
	x = room_width;
	hsp *= -1;
}
if(y < 0){
	y = 0;
	vsp *= -1;
}
if(y > room_height){
	y = room_height;
	vsp *= -1;
}
#endregion
#region shark check

	if(check_near_both_sharks()){
    achievement_earn("Shark Whisperer");}

#endregion







#region royal encounter check
var royal_entities = ["Emperor Tetra", "Rosy Tetra"]; // Define entities for the royal encounter
if (check_entities_catalogued(royal_entities)) {

    achievement_earn("Royal Encounter");
}
#endregion

#region sworfish
var flash = ["Swordfish"]; 
if (check_entities_catalogued(flash)) {

    achievement_earn("Is it a sword or racecar??");
}
#endregion


#region treasure
var treasure = ["Swordfish"]; 
if (check_entities_catalogued(treasure)) {

    achievement_earn("Is it a sword or racecar??");
}
#endregion

#region treasure
// List of treasures for scanning
var treasures = ["Gold Crown", "Gold Bars", "Gold Necklace", "Gold Dragon Statue"];

// Variables to track treasure scanning progress
var treasure_scanned = false;
var all_treasures_found = true;

// Check treasures
for (var i = 0; i < array_length(treasures); i++) {
    // Find the treasure instance and check if it's scanned
    var treasure_inst = instance_find_by_name(treasures[i]);
    if (treasure_inst != noone && treasure_inst.is_scanned) {
        treasure_scanned = true; // At least one treasure is found
    } else {
        all_treasures_found = false; // If any treasure is missing
    }
}

// Unlock the achievement for scanning any treasure
if (treasure_scanned) {
    achievement_earn("Oh! Shinning. Oh! lala");
}

// Unlock the achievement for scanning all treasures
if (all_treasures_found) {
    achievement_earn("What do I do with this?");
}
#endregion

#region dragon
var Dragon = ["Cute Dragon"]; // Define entities for the royal encounter
if (check_entities_catalogued(Dragon)) {
    // Perform actions when the royal encounter is fulfilled
    achievement_earn("Did you see it? Did you really see it?");
}
#endregion


#region tool
var toolchange = keyboard_check_pressed(ord("E")) - keyboard_check_pressed(ord("Q"));
current_tool = mod2(current_tool + toolchange, 3);

if(keyboard_check_pressed(ord("1"))) current_tool = 0;
if(keyboard_check_pressed(ord("2"))) current_tool = 1;
if(keyboard_check_pressed(ord("3"))) current_tool = 2;

//get mouse target position
target_x = lerp(target_x, mouse_x - x, 0.2);
target_y = lerp(target_y, mouse_y - y, 0.2);
var dir = point_direction(0,0,target_x,target_y);
var dist = clamp(point_distance(0,0,target_x,target_y),64,range);
target_x = lengthdir_x(dist, dir);
target_y = lengthdir_y(dist, dir);

target_dist = dist;
target_dir = point_direction(0,0,abs(target_x),target_y);

arm_xscale = target_x >= 0 ? 1 : -1;//lerp(arm_xscale, target_x >= 0 ? 1 : -1, clamp(point_distance(x,y,mouse_x,mouse_y,)/256, 0.1, 1));
#endregion

sm_update(arm_sm);