draw_set_color(c_white); // Ensure a default color
draw_set_alpha(1); // Ensure full opacity

// Use surface drawing for clipping
var surf = surface_create(width, height);
surface_set_target(surf);
draw_clear_alpha(c_white, 0); // Clear with transparent background

// Draw buttons within the surface
with (obj_beast_button) {
    if (parent == other.id) {
        // Draw buttons relative to scroll container, adjusted by scroll offset
        draw_self_ext(x, y - other.scroll_offset, 1, 1, 0, c_white, 1);
    }
}

surface_reset_target();

// Draw the surface at the container's position
draw_surface(surf, x, y);

// Clean up surface
surface_free(surf);