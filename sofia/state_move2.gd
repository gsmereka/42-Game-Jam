extends State

@export var player : Player
@export var fov : Node2D

func Physics_Update(delta):
		move(delta)
		player.look_at(get_global_mouse_position())

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
	
