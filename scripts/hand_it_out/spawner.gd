extends Node2D

@export var man_scene = load("res://object_scenes/hand_it_out/man.tscn")

var place = 0
var wait = false


#func _ready() -> void:
	#await get_tree().create_timer(5.0).timeout
	#print("done")
	#var man = man_scene.instantiate()
	#man.set_type(0)
	#add_child(man)

func _process(delta: float) -> void:
	#await get_tree().create_timer(0.5).timeout
	if not wait:
		wait = true
		place = randi_range(0, 5)
		
		var man = man_scene.instantiate()
		man.position.x = 96 + 192 * place
		var man_type = randi_range(0,4)
		if man_type != 0:
			man_type = 1
		man.set_type(man_type)
		get_parent().get_node("Men").add_child(man)
		
		await get_tree().create_timer(0.75).timeout
		wait = false
	
