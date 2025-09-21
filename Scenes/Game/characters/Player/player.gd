extends CharacterBody2D

class_name Player

@export var moveSpeed: float = 200.0;
@export var life: int = 5

func _ready() -> void:
	var current_scene = get_tree().current_scene.name

	if current_scene == "FisrtAttempt":
		$FOV.visible = false
		$Shadows.visible = false


func _physics_process(delta: float) -> void:
	pass


func take_damage():
	life -= 1
	if life <= 0:
		$StateManager.force_change_state("DyingState")
