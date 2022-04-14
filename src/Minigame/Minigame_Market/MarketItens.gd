extends Area2D

var GRAVITY = 40

func _ready():
	randomize()
	var vec_x = rand_range(-60, 60)
	position = Vector2(vec_x, -75)
	
func _process(delta):
	position.y += GRAVITY * delta * Global.fruits_count
	if position.y >= 15:
		queue_free()

