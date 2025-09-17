extends Camera2D

func _ready() -> void:
	var scene = get_tree().current_scene
	if (!scene || scene != Node2D): return
	var bg = scene.get_node_or_null("Bg")
	if (!bg): return
	
	var bg_size = bg.texture.get_size() * bg.scale
	var rect = Rect2(bg.global_position - bg_size / 2, bg_size)
	var viewPortSize = get_viewport_rect().size
	var half = viewPortSize / 2
	
	limit_left = rect.position.x + half.x
	limit_top = rect.position.y + half.y
	limit_right = rect.position.x + rect.size.x - half.x
	limit_bottom = rect.position.y + rect.size.y - half.y
