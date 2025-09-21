extends Node2D

var moveSpeed: float = 200.0
var direct = Vector2.ZERO

func _ready() -> void:
	await get_tree().create_timer(3).timeout
	if is_inside_tree():
		queue_free()
	
func _physics_process(delta: float) -> void:
	position += moveSpeed * delta * direct


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		if body.has_method("take_damage"):
			body.take_damage()
			queue_free()
	pass # Replace with function body.
