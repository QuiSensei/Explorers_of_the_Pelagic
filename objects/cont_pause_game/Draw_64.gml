
if(pause) {
	if (keyboard_check_pressed(ord("R"))) {
	    pause = false; // Toggle resume play state
	}
	
	if (keyboard_check_pressed(ord("Q"))) {
		room_goto(rm_menu); // Toggle to quit game
	}
	
	
	instance_deactivate_object(obj_player);		// Disenable players movement
	// Draw a black rectanlge with opacity 0.6
	draw_set_alpha(0.6);
	draw_rectangle_color(0, 0, resW, resH,  c_black, c_black, c_black, c_black, 0);
	draw_set_alpha(1);
	
	draw_set_font(fnt_ui);
	draw_set_halign(fa_center);
	var centerX = 472;
	
	// Draw text when it is paused
	//draw_text_ext_transformed(centerX, 220, "Paused", 0, 500, 2, 2, 0);
	draw_text_ext_transformed_color(centerX, 220, "Paused", 0, 500, 2, 2, 0, c_white, c_white, c_white, c_white, 1);
	
	var fontSize = 0.7;
	draw_text_ext_transformed_color(centerX, 285, "Press \"R\" to resume", 0, 500, fontSize, fontSize, 0, c_white, c_white, c_white, c_white, 1);
	draw_text_ext_transformed_color(centerX, 330, "Press \"Q\" to quit", 0, 500, fontSize, fontSize, 0, c_white, c_white, c_white, c_white, 1);
	
	// Set the buttons visibility to false
	inst_bestiary_button.visible = false;
	inst_examine_button.visible = false;
	inst_claw_button.visible = false;
	inst_poke_button.visible = false;
	
	// Anchor the obj_volume, visible when pause
	obj_volume.x = camera_get_view_x(view_camera[0]) + 50; // X offset
	obj_volume.y = camera_get_view_y(view_camera[0]) + 50; // Y offset
	obj_volume.visible=  true;
	
} else {
	instance_activate_object(obj_player); // enable players movement
	
	// Set the buttons visibily back to true
	inst_bestiary_button.visible = true;
	inst_examine_button.visible = true;
	inst_claw_button.visible = true;
	inst_poke_button.visible = true;
	
	// disenable obj_valume if not pause
	obj_volume.visible=  false;
}