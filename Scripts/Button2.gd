extends Button
var passar = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():



func _on_Button2_pressed():
	passar += 1
	if passar >= 2:
			get_tree().change_scene("res://casa.tscn")
		
