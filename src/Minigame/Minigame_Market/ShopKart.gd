extends KinematicBody2D

var ACCELERATION = 400
var FRICTION = 600
var MAX_SPEED = 200
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
	if area.name == "Maca":
		Global.dinheiro -= round(1 * Global.inflacao)
		Global.BarraSaude += 1.5
		area.queue_free()
	if area.name == "MacaVerde":
		Global.dinheiro -= round(2 * Global.inflacao)
		Global.BarraSaude += 2
		area.queue_free()
	if area.name == "Leite":
		Global.dinheiro -= round(6 * Global.inflacao)
		Global.BarraSaude += 4
		area.queue_free()
	if area.name == "SucoLaranja":
		Global.dinheiro -= round(8 * Global.inflacao)
		Global.BarraSaude += 5
		area.queue_free()
	if area.name == "Pao":
		Global.dinheiro -= round(10 * Global.inflacao)
		Global.BarraSaude += 6
		area.queue_free()
	if area.name == "Aveia":
		Global.dinheiro -= round(15 * Global.inflacao)
		Global.BarraSaude += 7.5
		area.queue_free()
