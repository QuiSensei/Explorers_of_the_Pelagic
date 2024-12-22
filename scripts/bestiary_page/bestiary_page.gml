function bestiary_page(argument0) {
    // Clear existing UI elements
    instance_destroy(obj_beast_button);
    instance_destroy(obj_achievements_list);
    instance_destroy(cont_bestiary_details);

    // If achievements page is requested
    if (argument0 == "achievements") {
        instance_create_layer(0, 0, "Bestiary", obj_achievements_list);
        return;
    }

    // Bestiary page setup
    var list = global.bestiary[? argument0];
    var len = ds_list_size(list);
    var spr = object_get_sprite(obj_beast_button);

    // UI positioning constants
    var MARGIN_X = 64;
    var MARGIN_Y = 288;
    var LIST_WIDTH = 800 - MARGIN_X;
    var BUTTON_WIDTH = sprite_get_width(spr);
    var BUTTON_HEIGHT = sprite_get_height(spr);
    var PADDING_X = 10;
    var PADDING_Y = 5;

    var chosen = false;

    // Calculate max buttons per row
    var buttons_per_row = floor(LIST_WIDTH / (BUTTON_WIDTH + PADDING_X));

    // Create beast buttons
    for (var i = 0; i < len; i++) {
        var beast = list[| i];
        
        // Calculate grid position
        var row = floor(i / buttons_per_row);
        var col = i % buttons_per_row;
        
        var button_x = MARGIN_X + col * (BUTTON_WIDTH + PADDING_X);
        var button_y = MARGIN_Y + row * (BUTTON_HEIGHT + PADDING_Y);

        var inst = instance_create_layer(button_x, button_y, "Bestiary", obj_beast_button);

        // Handle text formatting
        var beast_name = beast[? "name"];
        
        // Function to format text dynamically
        var formatted_text = format_beast_name(beast_name, BUTTON_WIDTH);

        // Handle catalogued and uncatalogued beasts
        if (bestiary_is_catalogued(beast_name)) {
            inst.text = formatted_text;
            inst.action = bestiary_view;
            inst.arg = [beast_name, argument0];
            inst.image_blend = 0x888888; // Lighter color for catalogued
        
            // Automatically select first catalogued beast
            if (!chosen) {
                bestiary_view(inst.arg);
                chosen = true;
            }
        }
        else {
            inst.text = "???";
            inst.action = bestiary_view;
            inst.arg = [beast_name, argument0];
            inst.image_blend = 0x555555; // Darker color for uncatalogued
            inst.clickable = false;
        }
    }
}

// Helper function to format beast names
function format_beast_name(name, max_width) {
    // Split the name into words
    var words = string_split(name, " ");
    
    // If only one word, return as is
    if (array_length(words) == 1) {
        return name;
    }
    
    // If two words, split across two lines
    if (array_length(words) == 2) {
        return words[0] + "\n" + words[1];
    }
    
    // For more than two words, use a more complex splitting strategy
    var formatted = "";
    var current_line = "";
    
    for (var i = 0; i < array_length(words); i++) {
        // Check if adding this word would exceed max width
        var test_line = (current_line == "") ? words[i] : current_line + " " + words[i];
        
        // If line gets too long, start a new line
        if (string_width(test_line) > max_width) {
            formatted += (formatted == "" ? "" : "\n") + current_line;
            current_line = words[i];
        } else {
            current_line = test_line;
        }
    }
    
    // Add last line
    if (current_line != "") {
        formatted += (formatted == "" ? "" : "\n") + current_line;
    }
    
    return formatted;
}