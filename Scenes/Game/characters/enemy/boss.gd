extends CharacterBody2D
@onready var bala_scene = preload("res://Scenes/Game/characters/enemy/bullet.tscn")
var out = false
@export var actvate: bool = false
var actvated: bool = false

func _ready() -> void:
	if actvate:
		startBoss()

var	use_atackk = true

func _physics_process(delta: float) -> void:
	if (actvate && !actvated): startBoss()
	if (!get_parent().startBossBattle): return;
	
	#get_out()
	if (use_atackk):
		openCircle(delta)
		use_atackk = false
		recuperar_ataque_depois_de_delay()
		#get_in()
		launch_circular_burst_towards_player(self.get_parent().get_node("Player").position)

func startBoss() ->void:
	$AnimatedSprite2D.frame = 0;
	$AnimatedSprite2D.play("default")
	actvated = true

func endBoss() -> void:
	$AnimatedSprite2D.play_backyard("default")

func recuperar_ataque_depois_de_delay():
	await get_tree().create_timer(1).timeout
	use_atackk = true
	#get_out()
func launch_circular_burst_towards_player(player_position: Vector2) -> void:
	var quantidade = 16  # Número de balas no círculo
	var raio = 32.0      # Distância do centro até as balas

	# Direção geral: da origem (inimigo) até o player
	var direcao_geral = (player_position - global_position).normalized()

	for i in range(quantidade):
		var angulo = TAU * i / quantidade
		var offset = Vector2(cos(angulo), sin(angulo)) * raio

		var bala = bala_scene.instantiate()
		bala.global_position = global_position + offset  # Posiciona ao redor do inimigo
		bala.direct = direcao_geral                      # Todas vão para o player
		get_parent().add_child(bala)

func openCircle(delta) -> void:
	var quantidade = 64  # número de balas
	var raio_inicial = 50
	var raio_crescente = 20  # quanto o raio cresce por segundo
	var tempo_total = 2.0  # tempo que o círculo vai crescer

	var timer = 0.0
	timer += delta
	var raio_atual = raio_inicial + (raio_crescente * timer)

	if timer > tempo_total:
		set_process(false)
		return

	for i in range(quantidade):
		var angulo = TAU * i / quantidade  # TAU = 2π
		var direcao = Vector2(cos(angulo), sin(angulo)).normalized()

		var bala = bala_scene.instantiate()
		bala.position = self.position
		get_parent().add_child(bala)

		bala.position = self.position
		bala.direct = direcao
