extends Sprite2D


func _ready():
	hide()


func _on_player_lose() -> void:
	show()
