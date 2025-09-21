extends State
@export var pai : CharacterBody2D

func Enter():
	pass
	
func Update(_delta:float):
	if Input.is_action_just_pressed("ui_accept"):
		get_parent().change_state(self, "FreeeState")
	
	pai.timer += _delta
	
	# Verifica se vai sair da tela
	var future_pos: Vector2 = global_position + pai.direction * pai.speed * _delta
	
	if pai.timer >= pai.direction_change_time:
		pai.change_direction()
		pai.timer = 0.0
	
	pai.velocity = pai.direction * pai.speed
	pai.move_and_slide()
	pass

func Physics_Update(_delta:float):
	pass
	
func Exit():
	pass
	
