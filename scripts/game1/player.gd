extends Sprite2D

signal win
signal lose

@export var movement_speed = 10

var done = false

func lose_game():
	done = true
	lose.emit()

func win_game():
	done = true
	win.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not done:
		if Input.is_action_pressed("arrow_left"):
			position.x -= movement_speed
		if Input.is_action_pressed("arrow_right"):
			position.x += movement_speed
		
		for area in $Area2D.get_overlapping_areas():
			if area.is_in_group("bm"):
				lose_game()
		
		if Input.is_action_just_pressed("space"):
			var grabbed_areas = 0 # 0 = none, 1 = businessman, 2 = money
			for area in $Hand/Area2D.get_overlapping_areas():
				if area.is_in_group("money"):
					grabbed_areas = 2
				elif grabbed_areas != 2 and area.is_in_group("bm"):
					grabbed_areas = 1
			
			if grabbed_areas == 2:
				win_game()
			elif grabbed_areas == 1:
				lose_game()


func _on_businessman_seen() -> void:
	lose_game()
