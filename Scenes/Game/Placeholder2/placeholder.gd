extends Node2D
var walls = preload("res://Scenes/Game/objects/wall.tscn")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Esc"):
		var node = preload("res://Scenes/UI/Pause/pause.tscn").instantiate()
		get_tree().root.add_child(node)
		get_tree().paused = true

func _ready() -> void:
	print("testing")
	coverSceneByWalls()

@onready var bg = $Bg

func coverSceneByWalls() -> void:
	var screen = bg.texture.get_size()
	var tile: float = 32.0
	var width: float = screen.x
	var height: float = screen.y
	
	var top = walls.instantiate()
	top.position = Vector2(width / 2, -tile / 2)
	top.scale.x = width / tile
	add_child(top)
	
	var bot = walls.instantiate()
	bot.position = Vector2(width / 2, height + tile / 2)
	bot.scale.x = width / tile
	add_child(bot)
	
	var right = walls.instantiate()
	right.position = Vector2(width + tile / 2, height / 2)
	right.scale.y = height / tile
	add_child(right)
	
	var left = walls.instantiate()
	left.position = Vector2(-tile / 2, height / 2)
	left.scale.y = height / tile
	add_child(left)
	
	
