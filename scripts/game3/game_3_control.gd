extends Node2D


func start_game(input):
	pass


func _on_character_body_2d_win() -> void:
	await get_tree().create_timer(0.5).timeout
	get_parent().won_game(1)
