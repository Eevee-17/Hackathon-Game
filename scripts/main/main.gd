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
	$GameOver.hide()

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
		
		var selected_game = randi_range(0,1)
		if selected_game == 0:
			if money < 3:
				selected_game = 1
			else:
				$InBetween/AudioStreamPlayer.play()
			
				$InBetween/Label.text = "Give to the homeless!"
				
				for num in range(3):
					$InBetween/Countdown.text = "Countdown: " + str(3 - num) 
					await get_tree().create_timer(1.0).timeout
				
				$Game.start_game($MainControl.hand_it_out, money)
				$GameBackgroundMusic.play()
		if selected_game == 1:
			$InBetween/AudioStreamPlayer.play()
			
			$InBetween/Label.text = "Steal from the rich businessman!"
			
			for num in range(3):
				$InBetween/Countdown.text = "Countdown: " + str(3 - num) 
				await get_tree().create_timer(1.0).timeout
			
			$Game.start_game($MainControl.game1_scene, 0)
			$GameBackgroundMusic.play()
		
		$InBetween.hide()
	else:
		$GameOver.show()
		$GameOver/AudioStreamPlayer.play()

func _on_game_game_ended(game_num: Variant, money_val: Variant, lives_left: Variant) -> void:
	$GameBackgroundMusic.stop()
	cutscene()
