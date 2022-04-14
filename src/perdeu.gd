extends Node2D


# Declare member variables here. Examples:
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
	Global.cena = Vector2(407,245)
	Global.mudarcena=true
	Global.minigameGYMsaida=false
	Global.minigameMARKETsaida=false
	Global.casaTRIVIAsaida=false

