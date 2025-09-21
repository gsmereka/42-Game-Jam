extends State
@export var pai : CharacterBody2D

func Enter():
	pass
	
func Update(_delta:float):
	
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


func _on_area_2d_body_entered(body: Node2D) -> void:
	if !body is Player:
		return
	pai.target = body
	get_parent().call_deferred("change_state", self, "AimPlayer")
	#'
	#get_parent().change_state(self, "AimPlayer")
	pass # Replace with function body.
