extends Control

signal start_game(game_scene)

@export var game1_scene = load("")


func _on_game1_button_pressed() -> void:
	start_game.emit(game1_scene)


func _on_start_game(game_scene: Variant) -> void:
	for child in $GameButtons.get_children():
		child.disabled = true


func _on_game_game_ended(game_num: Variant, money_val: Variant) -> void:
	$Info.text = "Games done: " + str(game_num) + "\nMoney: " + str(money_val)
	for child in $GameButtons.get_children():
		child.disabled = false
