extends Control

@export var vel : int = 300
@export var main_scene : String = "res://Scenes/Game/Placeholder/Placeholder.tscn"
var to_play = false

func _on_start_pressed() -> void:
	if to_play:
		return
	$Camera2D/LabelPularIntro.show()
	$AnimationPlayer.play("Intro")
	to_play = true
	pass # Replace with function body.

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Esc"):
		SceneLoader.load_scene(main_scene)

func _on_config_pressed() -> void:
	if to_play:
		return
	var node = preload("res://Scenes/UI/Config/config.tscn")
	var config = node.instantiate()
	add_child(config)
	pass # Replace with function body.


func _on_credits_pressed() -> void:
	if to_play:
		return
	SceneLoader.load_scene("res://Scenes/Credits/Credits.tscn")
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	if to_play:
		return
	get_tree().quit()
	pass # Replace with function body.


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if to_play:
		SceneLoader.load_scene(main_scene)
	pass # Replace with function body.
