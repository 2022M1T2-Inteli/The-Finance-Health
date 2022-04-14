extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


#	pass


func _on_Button_pressed():
	get_tree().change_scene("res://poupanca.tscn")


func _on_Button2_pressed():
	get_tree().change_scene("res://investir.tscn")


func _on_cdb_pressed():
	get_tree().change_scene("res://cdb.tscn")
