// In obj_beast_button Create Event
discovered = false;

// In obj_beast_button Draw Event
draw_self();

// Safely check discovered status
if (variable_instance_exists(id, "discovered") && discovered) {
    // Subtle gradient or glow effect
    var grad_color1 = merge_color(c_white, c_blue, 0.1);
    var grad_color2 = merge_color(c_white, c_blue, 0.2);
    
    // Draw gradient background
    draw_rectangle_color(
        x, y, 
        x + sprite_width, y + sprite_height, 
        grad_color1, grad_color1, 
        grad_color2, grad_color2, 
        false
    );
    
    // Optional: Add a subtle border
    draw_rectangle_color(
        x, y, 
        x + sprite_width, y + sprite_height, 
        c_blue, c_blue, c_blue, c_blue, 
        true
    );
}

// Text drawing logic
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Split text by newline and draw centered
var lines = string_split(text, "\n");
var line_height = string_height("M");
var total_height = line_height * array_length(lines);
var start_y = y + (sprite_height - total_height) / 2;

draw_set_color(c_black); // Ensure text is readable

for (var i = 0; i < array_length(lines); i++) {
    draw_text(x + sprite_width/2, start_y + i * line_height, lines[i]);
}