extends Node2D

var lives
var money
var game_counter = 0


func start():
	$TitleScreen.hide()
	#$MainControl.show()
	lives = $Game.lives
	money = $Game.money
	cutscene()

func _ready() -> void:
	$MainControl.hide()
	$InBetween.hide()

func cutscene():
	$InBetween.show()
	
	lives = $Game.lives
	money = $Game.money
	
	if lives < 4:
		$InBetween/Hearts/Heart4.hide()
	if lives < 3:
		$InBetween/Hearts/Heart3.hide()
	if lives < 2:
		$InBetween/Hearts/Heart2.hide()
	if lives < 1:
		$InBetween/Hearts/Heart1.hide()
	
	$InBetween/MoneyDisplay/MoneyAmount.text = str(money)
	
	$InBetween/Label.text = "Steal from the rich businessman!"
	
	for num in range(5):
		$InBetween/Countdown.text = "Countdown: " + str(5 - num) 
		await get_tree().create_timer(1.0).timeout
	
	$Game.start_game($MainControl.game1_scene, 0)
	
	$InBetween.hide()

func _on_game_game_ended(game_num: Variant, money_val: Variant, lives_left: Variant) -> void:
	cutscene()
