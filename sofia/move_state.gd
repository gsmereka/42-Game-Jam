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
	var will_exit_screen = (
		future_pos.x < 0 or future_pos.x > pai.screen_size.x - 20 or
		future_pos.y < 0 or future_pos.y > pai.screen_size.y - 20
	)
	
	if pai.timer >= pai.direction_change_time or will_exit_screen:
		pai.change_direction()
		pai.timer = 0.0
	
	pai.velocity = pai.direction * pai.speed
	pai.move_and_slide()
	pass

func Physics_Update(_delta:float):
	pass
	
func Exit():
	pass
	
