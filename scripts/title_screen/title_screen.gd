extends Control



func _on_start_button_pressed() -> void:
	get_parent().start()
	$AudioStreamPlayer.stop()
