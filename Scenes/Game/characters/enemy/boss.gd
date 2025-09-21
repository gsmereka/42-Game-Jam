extends CharacterBody2D
@onready var bala_scene = preload("res://Scenes/Game/characters/enemy/bullet.tscn")

func _ready() -> void:
	$AnimatedSprite2D.play("default")

var	use_atackk = true

func _physics_process(delta: float) -> void:
	if (use_atackk):
		openCircle(delta)
		use_atackk = false
		recuperar_ataque_depois_de_delay()
	
func recuperar_ataque_depois_de_delay():
	await get_tree().create_timer(0.8).timeout
	use_atackk = true

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
