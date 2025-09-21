extends CanvasLayer

func _process(delta: float) -> void:
	visible = get_parent().startBossBattle
