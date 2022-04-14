extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in Global.extrato:
		if(i>0):
			$extrato/extratinho.add_item("R$ " + str(i))
			$extrato/extratinho.set_item_custom_fg_color($extrato/extratinho.get_item_count()-1,Color.green)
			
		else:
			$extrato/extratinho.add_item("R$ " + str(i))
			$extrato/extratinho.set_item_custom_fg_color($extrato/extratinho.get_item_count()-1,Color.red)





func _on_Button_pressed():
	get_tree().change_scene("res://investir.tscn")
