extends Node2D

var moveSpeed: float = 300.0
var direct = Vector2.ZERO

func _physics_process(delta: float) -> void:
	position += moveSpeed * delta * direct
