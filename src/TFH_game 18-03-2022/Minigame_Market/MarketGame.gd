extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	$dinheiro.text = String(Global.dinheiro)


func _on_exut_minigame_pressed():
	get_tree().change_scene("res://mercadocerto.tscn")
