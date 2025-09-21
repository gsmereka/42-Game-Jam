extends Control

# Variáveis de configuração
var texture_rect_scene : PackedScene  # A cena do TextureRect que será clonada
var speed : float = 200  # Velocidade do movimento
var num_items : int = 3  # Número de itens no carrossel
var spacing : float = 300  # Espaçamento entre os itens

# Armazena os TextureRects
var textures : Array = []

func _ready():
	# Carregar a cena do TextureRect
	texture_rect_scene = preload("res://Scenes/UI/Menu/MenuBackground.tscn")
	
	# Criar e posicionar os TextureRects
	for i in range(num_items):
		var texture_rect = texture_rect_scene.instantiate()
		texture_rect.position = Vector2(i * spacing, 0)
		add_child(texture_rect)
		textures.append(texture_rect)

func _process(delta):
	# Mover os itens para a esquerda
	for texture_rect in textures:
		texture_rect.position.x -= speed * delta
	
	# Verificar se algum item saiu da tela à esquerda
	for texture_rect in textures:
		if texture_rect.position.x < -texture_rect.size.x:
			# Reposiciona o item para o final
			texture_rect.position.x = textures[-1].position.x + spacing
			# Move o item para o final da lista para manter a ordem
			textures.append(textures.pop_front())
