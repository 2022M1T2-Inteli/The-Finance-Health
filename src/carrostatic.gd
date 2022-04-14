extends StaticBody2D

var carposition = Vector2()
onready var speed = 50


func _process(delta):
	position.x += speed * delta
	if position.x >= 975:
		self.position = Vector2(-4, -16)
