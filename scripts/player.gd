extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _process(delta: float) -> void:
	var lr_direction := Input.get_axis("ui_left", "ui_right")
	var ud_direction := Input.get_axis("ui_up", "ui_down")
	if lr_direction || ud_direction:
		velocity.x = lr_direction * SPEED
		velocity.y = ud_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()
