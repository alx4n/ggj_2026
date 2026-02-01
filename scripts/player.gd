extends CharacterBody2D

var win = false
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _process(delta: float) -> void:
	if win:
		print("you win!")
	var lr_direction := Input.get_axis("ui_left", "ui_right")
	var ud_direction := Input.get_axis("ui_up", "ui_down")
	$CanvasLayer/ProgressBar.value -= delta * 5
	if lr_direction || ud_direction:
		$idleSprite.visible = false
		velocity.x = lr_direction * SPEED
		velocity.y = ud_direction * SPEED
		if velocity.x > 0.0:
			$AnimationTree["parameters/conditions/right"] = true
			$AnimationTree["parameters/conditions/left"] = false
			$AnimationTree["parameters/conditions/up"] = false
			$AnimationTree["parameters/conditions/back"] = false
			$frontBackSprite.visible = false
			$leftRightSprite.visible = true
		elif velocity.x < 0.0:
			$AnimationTree["parameters/conditions/left"] = true
			$AnimationTree["parameters/conditions/right"] = false
			$AnimationTree["parameters/conditions/up"] = false
			$AnimationTree["parameters/conditions/back"] = false
			$frontBackSprite.visible = false
			$leftRightSprite.visible = true
		elif velocity.y > 0.0:
			$AnimationTree["parameters/conditions/left"] = false
			$AnimationTree["parameters/conditions/right"] = false
			$AnimationTree["parameters/conditions/back"] = false
			$AnimationTree["parameters/conditions/up"] = true
			$frontBackSprite.visible = true
			$leftRightSprite.visible = false
		else:
			$AnimationTree["parameters/conditions/left"] = false
			$AnimationTree["parameters/conditions/right"] = false
			$AnimationTree["parameters/conditions/up"] = false
			$AnimationTree["parameters/conditions/back"] = true
			$frontBackSprite.visible = true
			$leftRightSprite.visible = false
	else:
		$idleSprite.visible = true
		$frontBackSprite.visible = false
		$leftRightSprite.visible = false
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()


func _on_door_body_entered(body: Node2D) -> void:
	if body == self:
		pass
	pass # Replace with function body.


func _on_dog_body_entered(body: Node2D) -> void:
	win = true
	pass # Replace with function body.
