extends Node2D

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Esc"):
		var node = preload("res://Scenes/UI/Pause/pause.tscn").instantiate()
		get_tree().root.add_child(node)
		get_tree().paused = true
