extends Node2D


# Declare member Nvariables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().change_scene("res://casa.tscn")


func _on_ler_pressed():
	get_tree().change_scene("res://Conteudo-Biblioteca.tscn")
	

