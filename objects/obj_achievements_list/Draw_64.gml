/// @description Draw Achievement UI
draw_set_font_format(fnt_button, fa_left, fa_top, c_black);

// Constants for UI layout
#macro ACHIEVEMENT_START_X 80
#macro ACHIEVEMENT_START_Y 80
#macro ACHIEVEMENT_WIDTH 600
#macro ACHIEVEMENT_HEIGHT 400
#macro ACHIEVEMENT_ITEM_HEIGHT 40
#macro CORNER_RADIUS 15
#macro TOP_PADDING 10 // Padding at the top of the scroll area

// Create or recreate surface if needed
if (!surface_exists(achievement_surface)) {
    achievement_surface = surface_create(ACHIEVEMENT_WIDTH, ACHIEVEMENT_HEIGHT);
}

// Handle mouse wheel scrolling
if (mouse_wheel_up()) {
    scroll_y = max(0, scroll_y - 10);
}
if (mouse_wheel_down()) {
    var max_scroll = (ds_list_size(global.bestiary[? "achievements"]) * ACHIEVEMENT_ITEM_HEIGHT) - ACHIEVEMENT_HEIGHT + TOP_PADDING;
    scroll_y = min(max_scroll, scroll_y + 10);
}

var achievement_list = global.bestiary[? "achievements"];
var achievement_len = ds_list_size(achievement_list);
var unlocked_achievements = 0;
var list = ds_list_create();

// Get unlocked achievements
if (ds_map_exists(global.save, "achievements")) {
    list = global.save[? "achievements"];
    unlocked_achievements = ds_list_size(list);
}

// Draw main box with rounded corners
draw_set_color(c_white);
draw_roundrect_ext(
    ACHIEVEMENT_START_X, 
    ACHIEVEMENT_START_Y, 
    ACHIEVEMENT_START_X + ACHIEVEMENT_WIDTH,
    ACHIEVEMENT_START_Y + ACHIEVEMENT_HEIGHT,
    CORNER_RADIUS, 
    CORNER_RADIUS, 
    false
);

// Start drawing to surface
surface_set_target(achievement_surface);
draw_clear_alpha(c_white, 0); // Clear surface with transparent background

// Draw achievements in scrollable area
for (var i = 0; i < achievement_len; i++) {
    var achievement = achievement_list[| i];
    var is_unlocked = false;
    var current_y = (i * ACHIEVEMENT_ITEM_HEIGHT) - scroll_y + TOP_PADDING;

    // Draw achievement items
    if (current_y >= TOP_PADDING - ACHIEVEMENT_ITEM_HEIGHT && 
        current_y <= ACHIEVEMENT_HEIGHT) {
        
        // Draw background for each achievement
        draw_set_color(c_ltgray);
        draw_roundrect_ext(
            5, // Small padding from edges
            current_y,
            ACHIEVEMENT_WIDTH - 5,
            current_y + ACHIEVEMENT_ITEM_HEIGHT - 2,
            8, // Smaller radius for achievement items
            8,
            false
        );

        // Check if achievement is unlocked
        if (ds_map_exists(global.save, "achievements")) {
            for (var j = 0; j < unlocked_achievements; j++) {
                if (achievement[? "name"] == list[| j]) {
                    is_unlocked = true;
                    break;
                }
            }
        }

        // Draw circle indicator
        draw_set_color(is_unlocked ? c_green : c_gray);
        draw_circle(15, current_y + ACHIEVEMENT_ITEM_HEIGHT / 2, 8, false);

        // Draw achievement text
        var full_text = achievement[? "name"] + " - " + achievement[? "description"];
        var wrapped_text = wrap_text(full_text, ACHIEVEMENT_WIDTH - 50);

        draw_set_color(is_unlocked ? c_green : c_gray);
        draw_text(30, current_y + ACHIEVEMENT_ITEM_HEIGHT / 2 - 8, wrapped_text);
    }
}

// Reset surface target
surface_reset_target();

// Draw the surface
draw_surface(achievement_surface, ACHIEVEMENT_START_X, ACHIEVEMENT_START_Y);

// Draw sticky header (always on top)
draw_set_color(c_white);
draw_rectangle(
    ACHIEVEMENT_START_X, 
    ACHIEVEMENT_START_Y - 30,
    ACHIEVEMENT_START_X + ACHIEVEMENT_WIDTH,
    ACHIEVEMENT_START_Y,
    false
);

// Draw header text
draw_set_color(c_black);
draw_text(ACHIEVEMENT_START_X, ACHIEVEMENT_START_Y - 30, 
    "Achievements " + string(unlocked_achievements) + "/" + string(achievement_len));

// Draw progress bar
var progress_width = ACHIEVEMENT_WIDTH;
draw_set_color(c_ltgray);
draw_roundrect_ext(
    ACHIEVEMENT_START_X, 
    ACHIEVEMENT_START_Y - 15,
    ACHIEVEMENT_START_X + progress_width,
    ACHIEVEMENT_START_Y - 5,
    5,
    5,
    false
);
draw_set_color(c_green);
draw_roundrect_ext(
    ACHIEVEMENT_START_X,
    ACHIEVEMENT_START_Y - 15,
    ACHIEVEMENT_START_X + (progress_width * (unlocked_achievements / achievement_len)),
    ACHIEVEMENT_START_Y - 5,
    5,
    5,
    false
);

// Draw box outline with rounded corners
draw_set_color(c_ltgray);
draw_roundrect_ext(
    ACHIEVEMENT_START_X,
    ACHIEVEMENT_START_Y,
    ACHIEVEMENT_START_X + ACHIEVEMENT_WIDTH,
    ACHIEVEMENT_START_Y + ACHIEVEMENT_HEIGHT,
    CORNER_RADIUS,
    CORNER_RADIUS,
    true
);
