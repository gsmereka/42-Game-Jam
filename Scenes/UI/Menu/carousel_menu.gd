extends Control

var vetor: Array
func _ready() -> void:
	vetor.append(get_children())
	
@onready var current_node = $TextureRect
@onready var next_node = $TextureRect2
@onready var prev_node = $TextureRect3

func _process(delta: float) -> void:
	position.x -= ($"..".vel * delta)
	var temp_node
	if current_node.global_position.x < 0:
		prev_node.global_position.x = next_node.global_position.x + 1920
		temp_node = prev_node
		prev_node = current_node
		current_node = next_node
		next_node = temp_node
	
	pass
