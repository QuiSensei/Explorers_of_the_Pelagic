//Disable alpha blending
gpu_set_blendenable(false);

if(pause) {
	surface_set_target(application_surface);
	if(surface_exists(pause_surface)) {
		draw_surface(pause_surface, 0, 0);
	} else {
		pause_surface = surface_create(resW, resW);
		buffer_set_surface(pause_surface_buffer, pause_surface, 0);
	}
	surface_reset_target();
}

if(keyboard_check_pressed(ord("P"))) {
	if(!pause) {
		pause = true;
		
		//deactivates evrything other than this instance
		instance_deactivate_all(true);
		
		//Caoture this game moment(won't capture draw ui though)
		pause_surface = surface_create(resW, resH);
		surface_set_target(pause_surface);
		draw_surface(application_surface, 0, 0);
		surface_reset_target();
		
		//Back up this surface to a buffer in case we lose it
		if(buffer_exists(pause_surface_buffer)) buffer_delete(pause_surface_buffer);
		pause_surface_buffer = buffer_create(resW * resH * 4, buffer_fixed, 1);
		buffer_get_surface(pause_surface_buffer, pause_surface, 0);
	} else {
		pause = false;
		
		//Activates all instance
		instance_activate_all();
		if(surface_exists(pause_surface)) surface_free(pause_surface);
		if(buffer_exists(pause_surface_buffer)) buffer_delete(pause_surface_buffer);
	}
}

//Enable alpha blending
gpu_set_blendenable(true);