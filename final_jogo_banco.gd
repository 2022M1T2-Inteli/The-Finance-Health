extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$TrabalhoFinal/Label.text = str(Global.dinheirojogo)
	Global.dinheiro += Global.dinheirojogo
	Global.dinheirojogo = 0


func _on_Button_pressed():
	get_tree().change_scene("res://banco.tscn")
