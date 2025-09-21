extends Node2D

@export var max_value: float = 50
@export var current_value: float = 0

@export var bar_height: float = 20
@export var bar_color: Color = Color.RED
@export var background_color: Color = Color.DARK_GRAY
@export var bottom_margin: float = 48

func _process(delta: float) -> void:
	current_value = get_parent().get_parent().bossLife
	queue_redraw()

func _draw():
	var viewport_size = get_viewport_rect().size
	var bar_width = viewport_size.x * 0.75  # 3/4 da largura da tela
	var ratio = clamp(current_value / max_value, 0.0, 1.0)
	var width = bar_width * ratio

	var x = (viewport_size.x - bar_width) / 2  # centralizado
	var y = viewport_size.y - bottom_margin - bar_height

	var bar_position = Vector2(x, y)
	var background_rect = Rect2(bar_position, Vector2(bar_width, bar_height))
	var fill_rect = Rect2(bar_position, Vector2(width, bar_height))

	# fundo da barra
	draw_rect(background_rect, background_color)

	# barra vermelha
	draw_rect(fill_rect, bar_color)

func set_value(value: float):
	current_value = clamp(value, 0, max_value)
	queue_redraw()
