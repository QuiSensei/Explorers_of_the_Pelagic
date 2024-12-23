if (!loc) {
    var text_width = string_width(text);
    var text_height = string_height(text);
    var padding = 16; // Increased padding for better spacing
    var corner_radius = 24; // Added corner radius for pill shape
    
    var rect_x1 = x - text_width / 2 - padding;
    var rect_y1 = y - text_height / 2 - padding;
    var rect_x2 = x + text_width / 2 + padding;
    var rect_y2 = y + text_height / 2 + padding;
    
    // Draw background with rounded corners
    draw_set_color(make_color_rgb(0, 102, 204)); // Solid blue color
    
    // Main rounded rectangle
    draw_roundrect_ext(rect_x1, rect_y1, rect_x2, rect_y2, corner_radius, corner_radius, false);
    
    // Optional: Add subtle shadow for depth
    draw_set_alpha(0.2);
    draw_roundrect_ext(rect_x1 + 2, rect_y1 + 2, rect_x2 + 2, rect_y2 + 2, corner_radius, corner_radius, false);
    draw_set_alpha(1);
    
    // Text styling
    draw_set_font(fnt_button);
    draw_set_color(c_white);
    draw_set_valign(fa_middle);
    draw_set_halign(fa_center);
    draw_text(x, y, text);
    
    // Reset alignment (good practice)
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
}