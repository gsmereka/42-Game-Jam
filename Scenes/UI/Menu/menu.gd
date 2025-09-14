extends Control


func _on_start_pressed() -> void:
	SceneLoader.load_scene("res://Scenes/Game/Placeholder/Placeholder.tscn")
	pass # Replace with function body.



func _on_config_pressed() -> void:
	var node = preload("res://Scenes/UI/Config/config.tscn")
	var config = node.instantiate()
	add_child(config)
	pass # Replace with function body.


func _on_credits_pressed() -> void:
	SceneLoader.load_scene("res://Scenes/Credits/Credits.tscn")
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
