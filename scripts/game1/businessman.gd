extends Sprite2D

signal seen

var player_ended = false


func _process(delta):
	if not player_ended:
		rotation -= 0.02
		
		if rotation < -3:
			player_ended = true
			seen.emit()
	


func _on_player_lose() -> void:
	player_ended = true


func _on_player_win() -> void:
	player_ended = true
