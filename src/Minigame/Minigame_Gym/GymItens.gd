extends Area2D

var SPEED = 150
var vec_y = [-10, -30, -90]

func _ready():
	randomize()
	for i in range (1):
		position = Vector2(240, _get_vec_y())
	
func _get_vec_y():
	var random_vec_y = vec_y[randi() % vec_y.size()]
	return random_vec_y
	
func _process(delta):
	position.x -= SPEED * delta * Global.gym_count
	if position.y > -30:
		$Sprite2.visible = false
	if position.x <= -96:
		queue_free()

func _on_HappyPlus_body_entered(body):
	if body.name == "GymPlayer":
		Global.BarraFelicidade += 1.5
		Global.gym_points += 1

func _on_Hurtbox_body_entered(body):
	if body.name == "GymPlayer":
		self.queue_free()
		Global.end_game = true
		Global.game = false
