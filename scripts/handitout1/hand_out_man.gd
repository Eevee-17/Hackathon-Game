extends Node2D

@export var movement_speed = 400
var type = 0 # 0 = homeless, 1 = businessman, 2 = rich homeless


func set_type(new_type):
	type = new_type
	if type == 0:
		$Man.texture = load("res://assets/homeless.png")
	elif type == 1:
		$Man.texture = load("res://assets/homeless_rich.png")
	else:
		$Man.texture = load("res://assets/businessman_wants_money.png")

func _process(delta: float) -> void:
	#set_type(0)
	position.y += movement_speed * delta
	
	for area in $Man/Area2D.get_overlapping_areas():
		if type == 0 and area.is_in_group("ready_to_give"):
			set_type(1)
			print(":)")
