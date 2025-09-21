extends AnimatedSprite2D

func _process(delta):
	var life = get_parent().get_parent().life
	# Certifique-se de que a animação certa está selecionada
	if animation != "default":
		animation = "default"
		stop()  # Parar a animação para definir o frame manualmente

	var total_frames = sprite_frames.get_frame_count("default")
	var frame_index = clamp(life, 0, total_frames - 1)

	frame = frame_index
