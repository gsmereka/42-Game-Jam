extends Node2D

@export var startBossBattle: bool = false
@export var bossLife: int = 50

var game_ended := false
func die():
	game_ended = true
	#await get_tree().create_timer(4).timeout
	#SceneLoader.load_scene("res://Scenes/Credits/Credits.tscn")


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if !game_ended:
		return
	finish()
	pass # Replace with function body.

func finish():
	await get_tree().create_timer(4).timeout
	SceneLoader.load_scene("res://Scenes/Credits/Credits.tscn")
