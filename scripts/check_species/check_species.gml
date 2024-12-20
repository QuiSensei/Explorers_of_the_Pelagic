/// @function check_entities_catalogued(required_entities)
/// @description Checks if all provided entities are catalogued.
/// @param required_entities Array of entity names to check.
function check_entities_catalogued(required_entities) {
    // Ensure the bestiary list exists
    if (ds_map_exists(global.save, "bestiary")) {
        var bestiary_list = global.save[? "bestiary"];
        
        // Loop through each entity in the provided array
        for (var i = 0; i < array_length(required_entities); i++) {
            if (ds_list_find_index(bestiary_list, required_entities[i]) == -1) {
                return false; // Entity not found
            }
        }
        
        return true; // All entities are found
    }
    
    return false; // Bestiary list doesn't exist
}
