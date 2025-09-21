extends CharacterBody2D

# Velocidade do boneco
var speed = 10

func _ready() -> void:
	$AnimatedSprite2D.play("default")

func _physics_process(delta: float) -> void:
	move(delta)

func move(delta) -> void:
	var dir = Vector2(1, -1)
	
	position += dir * speed * delta
