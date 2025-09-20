extends State

@export var pai: Node2D = 

func Enter():
	
	pass
	
func Update(_delta:float):
	pass

func Physics_Update(_delta:float):
	pai.timer += _delta
	
	# Atualiza direção do raycast
	
	# Verifica se vai sair da tela
	var future_pos = global_position + direction * speed * delta
	var will_exit_screen = (
		future_pos.x < 20 or future_pos.x > screen_size.x - 20 or
		future_pos.y < 20 or future_pos.y > screen_size.y - 20
	)
	
	if timer >= direction_change_time or will_exit_screen:
		change_direction()
		timer = 0.0
	
	velocity = direction * speed
	move_and_slide()
	pass
	
func Exit():
	pass
