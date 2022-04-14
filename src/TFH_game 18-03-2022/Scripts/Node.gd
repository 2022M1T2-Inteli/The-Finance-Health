extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$menu.visible = false




func _process(delta):
	if $ent/ent_cel.pressed == true:
		$ent/ent_cel.visible = false
	
	if get_node("menu/exit").pressed == true:
		$menu.visible = false
