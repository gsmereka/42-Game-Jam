extends CharacterBody2D

@export var speed = 0.0
@export var direction_change_time = 0.0

#@onready var step_sound: AudioStreamPlayer2D = $StepSound
#@onready var hit_sound: AudioStreamPlayer2D = $HitSound
#@onready var death_sound: AudioStreamPlayer2D = $DeathSound
@onready var idle_sound: AudioStreamPlayer2D = $IdleSound

@export var direction = Vector2.ZERO
@export var timer = 0.0
var screen_size
var raycast
var enemy_vision
@export var min_delay: float = 1.8  # tempo mínimo entre sons
@export var max_delay: float = 2.0  # tempo máximo entre sons
var target: Node2D

func _ready():
	$AnimatedSprite2D.play("default")
	screen_size = get_viewport_rect().size
	
	# Cria um RayCast2D para detectar bordas
	raycast = RayCast2D.new()
	add_child(raycast)
	raycast.enabled = true
	
	change_direction()
	play_idle_loop()


func play_idle_loop() -> void:
	# toca o som
	idle_sound.play()

	# calcula um delay aleatório
	var delay = randf_range(min_delay, max_delay)

	# espera o tempo antes de repetir
	await get_tree().create_timer(delay).timeout

	# chama de novo (loop manual)
	if is_inside_tree():
		play_idle_loop()

#func _physics_process(_delta):
	#if !idle_sound.playing:
		#idle_sound.play()
	#pass

func change_direction():
	# Gera direções que não levem para fora da tela
	var attempts = 0
	while attempts < 1:  # Evita loop infinito
		var angle = randf() * TAU
		var test_direction = Vector2(cos(angle), sin(angle))
		var test_pos = global_position + test_direction * 100
		direction = test_direction
		attempts += 1
			
		if test_pos.x:
			$AnimatedSprite2D.flip_h = test_pos.x < 0
		
	raycast.target_position = direction * 50  # Olha 10 pixels à frente
	
	# Se não achou direção válida, usa direção para o centro
	if attempts >= 10:
		var screen_center = screen_size * 100
		direction = global_position.direction_to(screen_center)

func take_damage():
	queue_free()
