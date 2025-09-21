extends CharacterBody2D

class_name Player

@export var moveSpeed: float = 200.0;
@export var life: int = 5
@onready var hit_player: AudioStreamPlayer2D = $HitPlayer

func _ready() -> void:
	var current_scene = get_tree().current_scene.name

	#if current_scene == "FisrtAttempt":
		#$FOV.visible = false
		#$Shadows.visible = false


func _physics_process(delta: float) -> void:
	if position.x > 300 and position.x < 350 and position.y > 550 and position.y < 600:
		get_parent().startBossBattle = true
	
	pass


func take_damage():
	life -= 1
	hit_player.play()
	if life <= 0:
		$StateManager.force_change_state("DyingState")
