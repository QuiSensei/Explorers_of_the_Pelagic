
if(pause) {
	if (keyboard_check_pressed(ord("R"))) {
	    pause = false; // Toggle pause state
	}
	
	if (keyboard_check_pressed(ord("Q"))) {
		room_goto(rm_menu);
	}
	
	instance_deactivate_object(obj_player);
	draw_set_alpha(0.6);
	draw_rectangle_color(0, 0, resW, resH,  c_black, c_black, c_black, c_black, 0);
	draw_set_alpha(1);
	
	draw_set_font(fnt_ui);
	draw_set_halign(fa_center);
	var centerX = 472;
	
	draw_text_ext_transformed(centerX, 220, "Paused", 0, 500, 2, 2, 0);
	
	var fontSize = 0.7;
	draw_text_ext_transformed(centerX, 285, "Press \"R\" to resume", 0, 500, fontSize, fontSize, 0);
	draw_text_ext_transformed(centerX, 330, "Press \"Q\" to quit", 0, 500, fontSize, fontSize, 0);
	
	inst_bestiary_button.visible = false;
	inst_examine_button.visible = false;
	inst_claw_button.visible = false;
	inst_poke_button.visible = false;
	
} else {
	instance_activate_object(obj_player);
	
	inst_bestiary_button.visible = true;
	inst_examine_button.visible = true;
	inst_claw_button.visible = true;
	inst_poke_button.visible = true;
}