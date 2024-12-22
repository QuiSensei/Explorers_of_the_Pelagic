function state_arm_examine(argument0, argument1) {
    var sm = argument0;
    switch (argument1) {
	
        case SM_EVENT.create:
            examination_progress = 0;
            if (instance_exists(examination_target)) {
                // Initialize is_scanned to false when the target is first created
                if (!variable_instance_exists(examination_target, "is_scanned")) {
                    examination_target.is_scanned = false;
                }
            }
            break;

        case SM_EVENT.update:
            if (mouse_check_button(mb_left) && instance_exists(examination_target)) {
                // Completely prevent scanning if already scanned
                if (examination_target.is_scanned) {
                    sm_switch(sm, state_arm_idle);
                    break;
                }

                if (
                    instance_position_tool(examination_target) || 
                    point_distance(x + target_x, y + target_y, examination_target.x, examination_target.y) < examination_large_range
                ) {
                    examination_progress += 1;
                    if (examination_progress >= 100) {
                        examination_progress = 100;

                        if (instance_exists(examination_target)) {
                            // Validate if target is a treasure or creature
                            if ((variable_instance_exists(examination_target, "is_treasure") && examination_target.is_treasure) || 
                                (examination_target.object_index == par_treasure)) {
                                create_notification(examination_target, "Discovered Treasure:\n" + examination_target.name);
                                examination_target.is_scanned = true; // Mark treasure as scanned
                            } else {
                                bestiary_catalogue(examination_target.name);
                                create_notification(examination_target, "Scanned Creature:\n" + examination_target.name);
                                examination_target.is_scanned = true; // Mark creature as scanned
                            }
                        }

                        sm_switch(sm, state_arm_describe);
                    }
                }
            } else {
                sm_switch(sm, state_arm_idle);
            }
            break;

case SM_EVENT.end_draw:
    if (instance_exists(examination_target) && !examination_target.is_scanned) {
        var xpos = examination_target.x, ypos = examination_target.bbox_bottom + 10;

        var bar_width = 100;  // Width of the progress bar
        var bar_height = 10;  // Height of the progress bar
        var margin = 2;       // Margin around the progress bar

        xpos = clamp(xpos, camera_get_view_x(view_camera[0]) + bar_width / 2, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - bar_width / 2);
        ypos = clamp(ypos, camera_get_view_y(view_camera[0]) + bar_height, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - bar_height * 2);

        // Background of the progress bar
        draw_set_color(c_black);
        draw_rectangle(xpos - bar_width / 2 - margin, ypos - margin, xpos + bar_width / 2 + margin, ypos + bar_height + margin, false);

        // Progress bar itself
        var progress_ratio = examination_progress / 100;
        draw_set_color(c_blue);
        draw_rectangle(xpos - bar_width / 2, ypos, xpos - bar_width / 2 + bar_width * progress_ratio, ypos + bar_height, false);

        // Border of the progress bar
        draw_set_color(c_gray);
        draw_rectangle(xpos - bar_width / 2 - margin, ypos - margin, xpos + bar_width / 2 + margin, ypos + bar_height + margin, true);

        // Optional: Label above the progress bar
        draw_set_font_format(fnt_button, fa_center, fa_bottom, c_white);
        draw_text(xpos, ypos +bar_height + 20, "Examining...");
    }
    break;

    }
}