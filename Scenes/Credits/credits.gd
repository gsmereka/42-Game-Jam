extends Node2D


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Esc"):
		SceneLoader.load_scene("res://Scenes/UI/Menu/menu.tscn")
