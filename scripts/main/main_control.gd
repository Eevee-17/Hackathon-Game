extends Control

signal start_game(game_scene, game_num)

@export var game1_scene = load("res://game_scenes/game_1.tscn")
@export var hand_it_out = load("res://game_scenes/hand_it_out_1.tscn")


func _on_game1_button_pressed() -> void:
	start_game.emit(game1_scene, 1)


func _on_start_game(_game_scene: Variant) -> void:
	for child in $GameButtons.get_children():
		child.disabled = true


func _on_game_game_ended(game_num: Variant, money_val: Variant, lives_left: Variant) -> void:
	$Info.text = "Games done: " + str(game_num) + "\nMoney: " + str(money_val) + "\nLives: " + str(lives_left)
	for child in $GameButtons.get_children():
		child.disabled = false


func _on_hand_it_out_button_pressed() -> void:
	start_game.emit(hand_it_out, 0)
