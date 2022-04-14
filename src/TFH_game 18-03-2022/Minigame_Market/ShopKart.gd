extends KinematicBody2D

var ACCELERATION = 350
var FRICTION = 850
var MAX_SPEED = 100
var RUN
var velocity = Vector2()

func _physics_process(delta):
	run_state(delta)
	
func run_state(delta):
	var input_vector = Vector2()
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2():
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		if input_vector.x > 0:
			$Sprite.flip_h = true
		elif input_vector.x < 0:
			$Sprite.flip_h = false
	else:
		velocity = velocity.move_toward(Vector2(), FRICTION * delta)

	velocity = move_and_slide(velocity)
	
	
func _on_Collect_area_entered(area):
	Global.dinheiro -= 1
	area.queue_free()
