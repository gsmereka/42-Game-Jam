extends State

@export var player : Player
@export var origin_bullet : Marker2D
var can_shoot = true
@export var fire_rate = 0.0
@export var bullet_scene = preload("res://Bullet.tscn")

func Enter():
	await get_tree().create_timer(1).timeout
	can_shoot = true

func Physics_Update(delta):
		if Input.is_action_pressed("Click") and can_shoot:
			shoot()
			
		move(delta)
		player.look_at(get_global_mouse_position())
		

		# Atira com espaço

func shoot():
	can_shoot = false

	var bullet = bullet_scene.instantiate()
	player.get_parent().add_child(bullet)

	# Direção = da arma até o mouse
	var dir = (get_global_mouse_position() - origin_bullet.global_position).normalized()
	bullet.setup(dir, origin_bullet.global_position)
	

	# Cooldown
	await get_tree().create_timer(fire_rate).timeout
	can_shoot = true

func manageSprites(vector: Vector2) -> void:
	pass

func move(delta: float) -> void:
	var vector = Vector2.ZERO
	
	vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	manageSprites(vector)
	
	vector = vector.normalized()

	player.velocity = vector * player.moveSpeed
	player.move_and_slide()
	
