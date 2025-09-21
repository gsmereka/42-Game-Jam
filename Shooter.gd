extends Node2D

@export var bullet_scene: PackedScene
@export var fire_rate: float = 0.2   # segundos entre tiros

var can_shoot: bool = true

func _process(delta: float) -> void:
	# Rotaciona para mirar no mouse
	look_at(get_global_mouse_position())

	# Atira com espaço
	if Input.is_action_pressed("Click") and can_shoot:
		shoot()

func shoot():
	can_shoot = false

	var bullet = bullet_scene.instantiate()
	get_tree().current_scene.add_child(bullet)

	# Direção = da arma até o mouse
	var dir = (get_global_mouse_position() - global_position).normalized()
	bullet.setup(dir, global_position)

	# Cooldown
	await get_tree().create_timer(fire_rate).timeout
	can_shoot = true
	
