extends CharacterBody2D

signal win(money)

const SPEED = 400.0
const JUMP_VELOCITY = -400.0

var coins = 0
var has_won = false


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if not has_won:
		# Handle jump.
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY-40
			
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction := Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == get_node("."):
		has_won = true
		win.emit(coins)


func _on_detection_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("coin"):
		area.queue_free()
		coins += 1
