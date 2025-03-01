extends Node2D


func _on_player_lose() -> void:
	await get_tree().create_timer(0.5).timeout
	get_parent().lost_game()


func _on_player_win() -> void:
	await get_tree().create_timer(0.5).timeout
	get_parent().won_game()
