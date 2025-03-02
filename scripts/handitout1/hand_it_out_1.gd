extends Node2D

var money = 0
var start_money = 0


func start_game(money_val):
	start_money = money_val
	money = start_money


func _on_player_give(is_business_man: Variant) -> void:
	if is_business_man:
		await get_tree().create_timer(1.0).timeout
		get_parent().lost_game(-start_money)
	else:
		money -= 1
		if money < 1:
			$Spawner.wait = true
			#await get_tree().create_timer(1.0).timeout
			get_parent().won_game(-start_money)
