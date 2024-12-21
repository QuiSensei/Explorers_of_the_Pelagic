/// @description Draw Achievement UI
draw_set_font_format(fnt_button, fa_left, fa_top, c_black);

// Constants for UI layout
#macro ACHIEVEMENT_START_X 80
#macro ACHIEVEMENT_START_Y 120
#macro ACHIEVEMENT_WIDTH 600
#macro ACHIEVEMENT_HEIGHT 300
#macro ACHIEVEMENT_ITEM_HEIGHT 40
#macro CORNER_RADIUS 15
#macro TOP_PADDING 10
#macro HEADER_Y_OFFSET 40  // Increased offset for larger header

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

// Start drawing to surface
surface_set_target(achievement_surface);
draw_clear_alpha(c_white, 0); // Clear with full transparency

// Draw achievements in scrollable area
for (var i = 0; i < achievement_len; i++) {
    var achievement = achievement_list[| i];
    var is_unlocked = false;
    var current_y = (i * ACHIEVEMENT_ITEM_HEIGHT) - scroll_y + TOP_PADDING;

    // Draw achievement items
    if (current_y >= TOP_PADDING - ACHIEVEMENT_ITEM_HEIGHT && 
        current_y <= ACHIEVEMENT_HEIGHT) {
        
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
        draw_set_color(is_unlocked ? c_blue : c_gray);
        draw_circle(15, current_y + ACHIEVEMENT_ITEM_HEIGHT / 2, 8, false);

        // Draw achievement text
        var full_text = achievement[? "name"] + " - " + achievement[? "description"];
        var wrapped_text = wrap_text(full_text, ACHIEVEMENT_WIDTH - 50);

        draw_set_color(is_unlocked ? c_blue : c_gray);
        draw_text(30, current_y + ACHIEVEMENT_ITEM_HEIGHT / 2 - 8, wrapped_text);
    }
}

// Reset surface target
surface_reset_target();

// Draw the surface
draw_surface(achievement_surface, ACHIEVEMENT_START_X, ACHIEVEMENT_START_Y);

// Draw header title with larger font
var original_font = draw_get_font();
draw_set_font(fnt_button);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);

// Set to a larger font for the header (make sure this font exists in your game)
var header_text = "Achievements " + string(unlocked_achievements) + "/" + string(achievement_len);
var text_scale = 1.5; // Scale up the text size

draw_text_transformed(
    ACHIEVEMENT_START_X, 
    ACHIEVEMENT_START_Y - HEADER_Y_OFFSET,
    header_text,
    text_scale,
    text_scale,
    0
);

// Reset font
draw_set_font(original_font);

// Draw progress bar with transparency
var progress_width = ACHIEVEMENT_WIDTH;
draw_set_alpha(0.8);
draw_set_color(c_blue);
draw_roundrect_ext(
    ACHIEVEMENT_START_X,
    ACHIEVEMENT_START_Y - 15,
    ACHIEVEMENT_START_X + (progress_width * (unlocked_achievements / achievement_len)),
    ACHIEVEMENT_START_Y - 5,
    5,
    5,
    false
);
draw_set_alpha(1);