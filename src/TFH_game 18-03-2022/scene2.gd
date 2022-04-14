extends Node
var passar = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.visible = false
	$legendas.visible = false


func _on_Button2_pressed():
	passar += 1
	if passar == 1:
		$Sprite.visible = true
		$legendas.visible = false
		
	if passar == 2:
		$Sprite.visible = false
		$legendas.visible = true
		
	if passar >= 3:
			get_tree().change_scene("res://casa.tscn")
