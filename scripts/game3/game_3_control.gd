extends Node2D

@export var police_pile = 2

var time = 0
var money


func start_game(input):
	money = input


func _on_character_body_2d_win(money: Variant) -> void:
	await get_tree().create_timer(0.5).timeout
	get_parent().won_game(money)


func _process(delta: float) -> void:
	if $PolicePile.position.y > 280:
		time += delta * 0.1
		$PolicePile.position.y -= police_pile * time


func _on_character_body_2d_lose() -> void:
	await get_tree().create_timer(0.5).timeout
	get_parent().lost_game(money)
