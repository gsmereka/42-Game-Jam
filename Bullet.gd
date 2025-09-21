extends CharacterBody2D

@export var speed: float = 2000.0
@export var lifetime: float = 3.0  # tempo máximo de vida
var direction: Vector2 = Vector2.ZERO

func _ready():
	hide()
	# Timer para autodestruição (se não colidir antes)
	await get_tree().create_timer(lifetime).timeout
	if is_inside_tree():
		queue_free()

func setup(dir: Vector2, start_pos: Vector2):
	direction = dir.normalized()
	global_position = start_pos
	rotation = direction.angle()

func _physics_process(delta: float) -> void:
	show()
	
	velocity = direction * speed
	move_and_slide()

	# Verifica colisões
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		handle_collision(collision.get_collider())

func handle_collision(collider):
	if collider is Player:
		queue_free()
		return
	# Aqui você pode checar se é inimigo, parede, etc
	if collider.has_method("take_damage"):
		collider.take_damage()
	# Por enquanto: qualquer coisa destrói a bala
	queue_free()
