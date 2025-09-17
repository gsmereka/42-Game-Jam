extends CharacterBody2D

@export var moveSpeed: float = 200.0;

func _physics_process(delta: float) -> void:
	move(delta)

func manageSprites(vector: Vector2) -> void:
	if (vector == Vector2.ZERO):
		return
	var sprite: Texture2D = load("res://Assets/player/front.png") if vector.y > 0 else \
							load("res://Assets/player/back.png") if vector.y < 0 else \
							load("res://Assets/player/side.png")
								
	$Sprite2D.texture = sprite
	if (vector.x):
		$Sprite2D.flip_h = vector.x < 0

func move(delta: float) -> void:
	var vector = Vector2.ZERO
	
	vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	manageSprites(vector)
		
	
	vector = vector.normalized()
	velocity = vector * moveSpeed
	move_and_slide()
	
