/// @description Insert description here
// You can write your code in this editor
// Create Event in a Controller/Spawner object
alarm[0] = random_range(300, 900);  // Will trigger between 5-15 seconds

// Alarm 0 Event
if (random(100) < 75)  // 15% chance to spawn
{
    instance_create_layer(room_width, random(room_height), "Instances", obj_flying);
}
alarm[0] = random_range(300, 900);  // Set next check