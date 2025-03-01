extends Node2D


func start():
	$TitleScreen.hide()
	$MainControl.show()

func _ready() -> void:
	$MainControl.hide()
