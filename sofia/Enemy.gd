extends CharacterBody2D

@export var speed = 90.0
@export var direction_change_time = 2.5

@export var direction = Vector2.ZERO
@export var timer = 0.0
var screen_size
var raycast
var enemy_vision

func _ready():
	screen_size = get_viewport_rect().size
	
	# Cria um RayCast2D para detectar bordas
	raycast = RayCast2D.new()
	enemy_vision = RayCast2D.new()
	add_child(raycast)
	#add_child(enemy_vision)
	raycast.enabled = true
	#enemy_vision.enabled = true
	
	change_direction()

func _physics_process(delta):
	pass

func change_direction():
	# Gera direções que não levem para fora da tela
	var attempts = 0
	while attempts < 1:  # Evita loop infinito
		var angle = randf() * TAU
		var test_direction = Vector2(cos(angle), sin(angle))
		var test_pos = global_position + test_direction * 100
		direction = test_direction
		attempts += 1
		
	raycast.target_position = direction * 200  # Olha 50 pixels à frente
		## Verifica se essa direção mantém na tela
		#if (test_pos.x > 20 and test_pos.x < screen_size.x - 20 and
			#test_pos.y > 20 and test_pos.y < screen_size.y - 20):
			#break
		#
	
	# Se não achou direção válida, usa direção para o centro
	if attempts >= 10:
		var screen_center = screen_size * 1
		direction = global_position.direction_to(screen_center)
