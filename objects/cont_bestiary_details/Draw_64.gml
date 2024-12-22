
draw_sprite(spr_beastiaryplaceholder, 0, 64, 64);
if (sprite_exists(sprite_index)) {
    draw_sprite(
        sprite_index,
        0,
        160 + sprite_get_xoffset(sprite_index) - sprite_get_width(sprite_index) / 2,
        160 + sprite_get_yoffset(sprite_index) - sprite_get_height(sprite_index) / 2
    );
}
// Set font for text
draw_set_font_format(fnt_button, fa_left, fa_top, c_black);
// Draw the main name
draw_text(288, 64, name);
// Draw the scientific name below the main name with smaller, italicized text
draw_set_font_format(fnt_button, fa_left, fa_top, c_gray); // Set to a different color (e.g., gray)
draw_text(288, 84, scientific_name ); // Offset to appear below the name
// Reset font color and draw the description with proper spacing
draw_set_font_format(fnt_button, fa_left, fa_top, c_black);
draw_text_ext(288, 120, description, string_height("M") + 5, 512);