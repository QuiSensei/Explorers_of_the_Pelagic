if (loc) {
    var w = string_width(text), h = string_height(text), marg = 8;
    var corner_radius = 10;

    var rect_x1 = x - w / 2 - marg;
    var rect_y1 = y - marg;
    var rect_x2 = x + w / 2 + marg;
    var rect_y2 = y + h + marg;

    // Draw rectangles for the body and sides
    draw_set_color(make_color_rgb(173, 216, 230)); // Light blue
    draw_rectangle(rect_x1 + corner_radius, rect_y1, rect_x2 - corner_radius, rect_y2, false);
    draw_rectangle(rect_x1, rect_y1 + corner_radius, rect_x2, rect_y2 - corner_radius, false);

    // Draw circles for the corners
    draw_circle(rect_x1 + corner_radius, rect_y1 + corner_radius, corner_radius, false);
    draw_circle(rect_x2 - corner_radius, rect_y1 + corner_radius, corner_radius, false);
    draw_circle(rect_x1 + corner_radius, rect_y2 - corner_radius, corner_radius, false);
    draw_circle(rect_x2 - corner_radius, rect_y2 - corner_radius, corner_radius, false);

    // Draw the text
    draw_set_color(c_white);
    draw_set_font_format(fnt_button, fa_center, fa_top, c_black);
    draw_text(x, y, text);
}
