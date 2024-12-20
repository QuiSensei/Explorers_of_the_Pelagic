function check_near_both_sharks() {
    var near_sawshark = false;
    var near_shark = false;
    
    var sawshark = instance_nearest(x, y, obj_sawshark);
    var shark = instance_nearest(x, y, obj_shark);
    
    if (sawshark != noone && shark != noone) {
        var dist_to_sawshark = point_distance(x, y, sawshark.x, sawshark.y);
        var dist_to_shark = point_distance(x, y, shark.x, shark.y);
        
        near_sawshark = (dist_to_sawshark <= examination_large_range);
        near_shark = (dist_to_shark <= examination_large_range);
        
        if (near_sawshark && near_shark) {
			achievement_earn("Shark Whisperer");
            return true;
        }
    }
    return false;
}