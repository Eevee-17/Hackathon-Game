extends Node2D


func start_game(input):
	pass

func _on_player_lose() -> void:
	await get_tree().create_timer(1.0).timeout
	get_parent().lost_game(0)


func _on_player_win() -> void:
	await get_tree().create_timer(1.0).timeout
	get_parent().won_game(1)
