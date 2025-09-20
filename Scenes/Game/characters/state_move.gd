extends State

@export var player : Player
@export var fov : Node2D
@export var animation : AnimationPlayer

func Physics_Update(delta):
		move(delta)
		fov.look_at(get_global_mouse_position())

func manageSprites(vector: Vector2) -> void:
	if !animation.is_playing():
		animation.play("Player_Idle")
	pass

func move(delta: float) -> void:
	var vector = Vector2.ZERO
	
	vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	manageSprites(vector)
	
	vector = vector.normalized()

	player.velocity = vector * player.moveSpeed
	player.move_and_slide()
	
