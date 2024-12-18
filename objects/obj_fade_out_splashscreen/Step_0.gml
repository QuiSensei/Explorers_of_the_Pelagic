{
	// if count is less than or equals 0 do this
	if(--countDown <= 0) {
		// Reduce alpha until fully transparent
		image_alpha = min(1.0, image_alpha + FADE_OUT_DELTA);
	}
	
	// if image_alpha greater than 1 or equal to 1 do this
	if(image_alpha >= 1.0) {
		room_goto(rm_menu);
	}
}