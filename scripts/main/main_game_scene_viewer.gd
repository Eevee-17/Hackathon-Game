extends Node2D

signal game_ended(game_num, money_val, lives_left)

var in_game = false
var money = 0
var scene
var game_counter = 0
var lives = 4


func lost_game():
	lives -= 1
	end_game()

func won_game():
	money += 1
	end_game()

func end_game():
	in_game = false
	game_counter += 1
	for child in get_children():
		child.queue_free()
	
	game_ended.emit(game_counter, money, lives)

func start_game(game_scene):
	in_game = true
	scene = game_scene.instantiate()
	add_child(scene)

func _on_main_control_start_game(game_scene: Variant) -> void:
	start_game(game_scene)
