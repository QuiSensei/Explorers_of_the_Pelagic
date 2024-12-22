if (!loc) {
    
    var text_width = string_width(text);
    var text_height = string_height(text);
    var padding = 10; 

   
    var rect_x1 = x - text_width / 2 - padding;
    var rect_y1 = y - text_height / 2 - padding;
    var rect_x2 = x + text_width / 2 + padding;
    var rect_y2 = y + text_height / 2 + padding;

   //gradiend
    var steps = 20; // Number of gradient steps
    var color_start = make_color_rgb(173, 216, 230); 
    var color_end = make_color_rgb(0, 102, 204); 

    for (var i = 0; i < steps; i++) {
        var interp = i / steps;
        var color = merge_color(color_start, color_end, interp);
        var strip_y1 = lerp(rect_y1, rect_y2, interp);
        var strip_y2 = lerp(rect_y1, rect_y2, (i + 1) / steps);
        draw_set_color(color);
        draw_rectangle(rect_x1, strip_y1, rect_x2, strip_y2, false);
    }

    // Text styling
    draw_set_font(fnt_button);
    draw_set_color(c_white);
    draw_text(x, y, text);   
}
