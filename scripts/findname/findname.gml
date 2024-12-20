function instance_find_by_name(name) {
    with (par_treasure) {
        if (self.name == name) {
            return id;
        }
    }
    return noone;
}