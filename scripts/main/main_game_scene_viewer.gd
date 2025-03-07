extends Node2D

signal game_ended(game_num, money_val, lives_left)

var in_game = false
var money = 0
var scene
var game_counter = 0
var lives = 4
var score = 0


func lost_game(money_amount, score_amount):
	lives -= 1
	money -= money_amount
	score -= score_amount
	end_game()

func won_game(money_amount, score_amoun):
	money += money_amount
	score += score_amoun
	end_game()

func end_game():
	if in_game:
		in_game = false
		game_counter += 1
		for child in get_children():
			child.queue_free()
		
		game_ended.emit(game_counter, money, lives)

func start_game(game_scene, input):
	in_game = true
	scene = game_scene.instantiate()
	add_child(scene)
	scene.start_game(input)


func _on_main_control_start_game(game_scene: Variant, game_num: Variant) -> void:
	if game_num == 0:
		if money > 0:
			start_game(game_scene, money)
	else:
		start_game(game_scene, 0)
