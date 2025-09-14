extends Node

@export_file("*.tscn") var next_scene_path: String # Cena a carregar
@export_file("*.tscn") var loading_scene_path: String = "res://Scenes/UI/LoadingScene/LoadingScene.tscn"

var time := 0
var loading_node: Node = null

func load_scene(path : String, waiting_time : int = 1):
	get_tree().current_scene.process_mode = Node.PROCESS_MODE_DISABLED
	time = waiting_time
	next_scene_path = path

	# Instancia a cena de loading (se configurada)
	if loading_scene_path != "":
		var loading_scene: PackedScene = load(loading_scene_path)
		if loading_scene:
			loading_node = loading_scene.instantiate()
			get_tree().get_root().add_child(loading_node)

	# Inicia o carregamento assíncrono
	ResourceLoader.load_threaded_request(next_scene_path)


func _process(_delta):
	if ResourceLoader.load_threaded_get_status(next_scene_path) == ResourceLoader.THREAD_LOAD_LOADED:
		set_process(false)
		await get_tree().create_timer(time).timeout

		# Pega a cena carregada
		var new_scene: PackedScene = ResourceLoader.load_threaded_get(next_scene_path)
		var new_node = new_scene.instantiate()

		# Substitui a cena atual
		
		var current_scene = get_tree().current_scene
		get_tree().get_root().add_child(new_node)
		get_tree().current_scene = new_node
		current_scene.queue_free()

		# Remove a cena de loading
		if loading_node:
			loading_node.queue_free()
			loading_node = null
		set_process(true)
