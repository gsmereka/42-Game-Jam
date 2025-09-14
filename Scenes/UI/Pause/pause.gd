extends Control


func _on_continue_pressed() -> void:
	if get_tree().paused:
		get_tree().paused = false
	self.queue_free()
	pass # Replace with function body.


func _on_config_pressed() -> void:
	var node = preload("res://Scenes/UI/Config/config.tscn").instantiate()
	add_child(node)
	pass # Replace with function body.


func _on_main_menu_pressed() -> void:
	if get_tree().paused:
		get_tree().paused = false
	self.queue_free()
	SceneLoader.load_scene("res://Scenes/UI/Menu/menu.tscn")
	pass # Replace with function body.


func _on_quit_game_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
