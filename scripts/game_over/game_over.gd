extends Node2D


func _on_retry_button_pressed() -> void:
	get_tree().change_scene_to_file("res://game_scenes/main.tscn")
