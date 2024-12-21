/// @description Initialize variables
achievement_surface = -1;
scroll_y = 0;

// Initialize text wrapping function
wrap_text = function(text, max_width) {
    var str_len = string_length(text);
    var str_width = string_width(text);
    
    if(str_width <= max_width) return text;
    
    var space_pos = 1;
    var last_space = 1;
    var current_width = 0;
    
    while(space_pos <= str_len) {
        if(string_char_at(text, space_pos) == " ") {
            current_width = string_width(string_copy(text, 1, space_pos));
            if(current_width > max_width) {
                return string_copy(text, 1, last_space - 1);
            }
            last_space = space_pos + 1;
        }
        space_pos++;
    }
    return text;
}