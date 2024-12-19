function bestiary_view(argument0) {
	var args = argument0, name = args[0], type = args[1];

	// Destroy any existing details instance
	instance_destroy(cont_bestiary_details);

	// Create a new instance for displaying bestiary details
	var inst = instance_create_layer(0, 0, "Bestiary", cont_bestiary_details);
	inst.name = name;

	// Fetch the list and iterate to find the item
	var list = global.bestiary[? type], len = ds_list_size(list);
	for (var i = 0; i < len; i++) {
		var item = list[| i];
		if (item[? "name"] == name) break;
	}

	// Exit if the item is not found
	if (i == len) exit;

	// Populate the instance with details
	inst.display_name = ds_map_find_value(item, "name"); // Separate name
	inst.scientific_name = ds_map_find_value(item, "scientific_name"); // Separate scientific name
	inst.description = ds_map_find_value(item, "description");
	inst.sprite_index = asset_get_index(ds_map_find_value(item, "sprite"));

	// Improve spacing for display
	inst.display_name = "\n" + inst.display_name + "\n"; // Add extra spacing for name
	inst.scientific_name = "(" + inst.scientific_name + ")\n"; // Format scientific name
	inst.description = string_replace_all(inst.description, "\n", "\n\n"); // Double newlines for better spacing
}
