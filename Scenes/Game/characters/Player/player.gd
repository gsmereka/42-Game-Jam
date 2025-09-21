extends CharacterBody2D

class_name Player

@export var moveSpeed: float = 200.0;
@export var life: int = 5
@onready var hit_player: AudioStreamPlayer2D = $HitPlayer
@onready var death_sound: AudioStreamPlayer2D = $DeathSound
@onready var death_screen: CanvasLayer = $TelaDeMorte

var is_dead = false

func _ready() -> void:
	var current_scene = get_tree().current_scene.name

	#if current_scene == "FisrtAttempt":
		#$FOV.visible = false
		#$Shadows.visible = false


func _physics_process(delta: float) -> void:
	if position.x > 300 and position.x < 350 and position.y > 550 and position.y < 600:
		get_parent().startBossBattle = true
	
	pass

func die():
	if is_dead:
		return
	is_dead = true
	
	death_sound.play()
	death_screen.visible = true
	$DeathPose.show()
	$"Sprite/Sprite-0002".hide()

	velocity = Vector2.ZERO
	set_physics_process(false)
	$CollisionShape2D.call_deferred("set_disabled", true)

	await get_tree().create_timer(2.4).timeout
	# força state para "DyingState"
	$StateManager.force_change_state("DyingState")
	get_tree().change_scene_to_file("res://Scenes/UI/Menu/menu.tscn")


func take_damage():
	life -= 1
	hit_player.play()
	if life <= 0:
		hit_player.stop()
		die()
