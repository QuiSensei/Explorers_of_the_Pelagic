{
	// Draw darkness at the start of game
	draw_set_color(FADE_COLOR);
	draw_set_alpha(image_alpha);
	draw_rectangle(0, 0, 10000, 10000, false);
	draw_set_alpha(1.0)
}