extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		get_parent().startBossBattle = true
	pass # Replace with function body.
