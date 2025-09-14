@tool
extends Control

@export var node_ref : Control
@export var color : Color
@onready var background := $ColorRect

func setup_background():
	if !node_ref:
		return
	background.size = node_ref.size
	background.global_position = node_ref.global_position
	background.color = color

func _process(delta: float) -> void:
	setup_background()
