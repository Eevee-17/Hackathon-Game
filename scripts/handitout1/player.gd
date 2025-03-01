extends Sprite2D

signal give(spot)

@export var left_walk_texture = preload("res://assets/player_back_1.png")
@export var right_walk_texture = preload("res://assets/player_back_2.png")

var place = 0
var walk_state = 0


func change_walk_state():
	if walk_state == 0:
		walk_state = 1
		texture = left_walk_texture
	if walk_state == 1:
		walk_state = 0
		texture = right_walk_texture

func _ready() -> void:
	change_walk_state()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("space"):
		$Area2D.add_to_group("ready_to_give")
		await get_tree().create_timer(0.5).timeout
		$Area2D.remove_from_group("ready_to_give")
		give.emit(place)
	if Input.is_action_just_pressed("arrow_left"):
		place -= 1
		change_walk_state()
	if Input.is_action_just_pressed("arrow_right"):
		place += 1
		change_walk_state()
	
	if place < 0:
		place = 0
	elif place > 5:
		place = 5
	
	position.x = 96 + 192 * place
