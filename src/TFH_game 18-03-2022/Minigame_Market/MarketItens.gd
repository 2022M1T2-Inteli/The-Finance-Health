extends Area2D

var MAXFALLSPEED = 200
var GRAVITY = 0.5

func _ready():
	randomize()
	var vec_x = rand_range(-60, 60)
	position = Vector2(vec_x, -75)
	
func _process(delta):
	position.y += GRAVITY
	if position.y >= MAXFALLSPEED:
		position.y = MAXFALLSPEED
	if position.y >= 15:
		queue_free()

