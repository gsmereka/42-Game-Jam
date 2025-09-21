extends State

@export var player : Player
@export var origin_bullet : Marker2D
var can_shoot = true
@export var fire_rate = 0.0
@export var bullet_scene = preload("res://Bullet.tscn")
@onready var footstep_sound: AudioStreamPlayer2D = $"../../Walking"
@onready var shoot_sound: AudioStreamPlayer2D = $"../../ShootSound"

func Enter():
	await get_tree().create_timer(1).timeout
	can_shoot = true

func Physics_Update(delta):
		if player.is_dead:
			return  # bloqueia movimento e tiro
		
		if Input.is_action_pressed("Click") and can_shoot:
			shoot()
			
		move(delta)
		player.look_at(get_global_mouse_position())

func shoot():
	if not can_shoot:
		return
	can_shoot = false

	var bullet = bullet_scene.instantiate()

	# direção da bala
	var dir = (get_global_mouse_position() - origin_bullet.global_position).normalized()

	# adiciona a bala na cena principal
	get_tree().current_scene.add_child(bullet)

	# configura a bala (posição e direção)
	bullet.setup(dir, origin_bullet.global_position)

	# toca som
	shoot_sound.play()

	# cooldown
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
	
	if vector != Vector2.ZERO:
		if not footstep_sound.playing:
			footstep_sound.play()
	else:
		footstep_sound.stop()
