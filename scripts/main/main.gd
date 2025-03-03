extends Node2D

@export var game1_scene = load("res://game_scenes/game_1.tscn")
@export var hand_it_out_1_scene = load("res://game_scenes/hand_it_out_1.tscn")
@export var game3_scene = load("res://game_scenes/game_3.tscn")

var lives
var money
var game_counter = 0


func start():
	$TitleScreen.hide()
	lives = $Game.lives
	money = $Game.money
	cutscene()

func _ready() -> void:
	$InBetween.hide()
	$GameOver.hide()

func play_game(game, game_input, game_text):
	$InBetween/AudioStreamPlayer.play()
	
	$InBetween/Label.text = game_text
	
	for num in range(3):
		$InBetween/Countdown.text = "Countdown: " + str(3 - num) 
		await get_tree().create_timer(1.0).timeout
	
	$Game.start_game(game, game_input)
	$GameBackgroundMusic.play()
	
	$InBetween.hide()

func cutscene():
	lives = $Game.lives
	money = $Game.money
	
	if lives > 0:
		if lives < 4:
			$InBetween/Hearts/Heart4.hide()
		if lives < 3:
			$InBetween/Hearts/Heart3.hide()
		if lives < 2:
			$InBetween/Hearts/Heart2.hide()
		if lives < 1:
			$InBetween/Hearts/Heart1.hide()
		
		$InBetween.show()
		
		$InBetween/MoneyDisplay/MoneyAmount.text = str(money)
		
		var max_game_val = 2
		var selected_game = randi_range(0, max_game_val)
		if selected_game == 0:
			if money <= 5:
				selected_game = randi_range(1, max_game_val)
			else:
				play_game(hand_it_out_1_scene, money, "Give to the homeless!")
		if selected_game == 0:
			pass # if game 0 failed
		elif selected_game == 1: # game 1
			play_game(game1_scene, 0, "Steal from the rich businessman!")
		elif selected_game == 2: # game 3 (still need to finish and implement game 2)
			play_game(game3_scene, money, "Escape the police!")
		
	else:
		$GameOver.show()
		$GameOver/AudioStreamPlayer.play()

func _on_game_game_ended(game_num: Variant, money_val: Variant, lives_left: Variant) -> void:
	$GameBackgroundMusic.stop()
	cutscene()
