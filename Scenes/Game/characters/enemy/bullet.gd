extends Node2D

var moveSpeed: float = 300.0
var direct = Vector2.ZERO

func _ready() -> void:
	await get_tree().create_timer(3).timeout
	if is_inside_tree():
		queue_free()
	
func _physics_process(delta: float) -> void:
	position += moveSpeed * delta * direct
