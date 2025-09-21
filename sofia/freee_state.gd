extends State
@export var pai : CharacterBody2D

func Enter():
	pass
	
func Update(_delta:float):
	if Input.is_action_just_pressed("ui_accept"):
		get_parent().change_state(self, "MoveState")
		
	
	pass

func Physics_Update(_delta:float):
	pass
	
func Exit():
	pass
	
