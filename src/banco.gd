extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _ready():
	$jogar.visible = false




func _process(delta):
	
	$Player/CanvasLayer/dia.text = str("Dia "+str(Global.dias))
	$Player/CanvasLayer/h.text = str(str(Global.horas) +"h"+ str(Global.minutos))
	$TileMap3/cabeloamarelo/AnimationPlayer.play("cabelo amarelo")
	$TileMap3/cabeloroxo/AnimationPlayer.play("cabelo roxo")
	$TileMap3/compquarto/AnimationPlayer.play("comp quarto")
	$TileMap3/compquarto2/AnimationPlayer.play("comp quarto")
	$TileMap3/tela/AnimationPlayer.play("telas")
	$objetos/sistemacomp/AnimationPlayer.play("sistema de comp")
	$objetos/sistemacomp2/AnimationPlayer.play("sistema de comp")


func _on_Area2D_body_entered(body):
	$jogar.visible=true

func _on_Area2D_body_exited(body):
	$jogar.visible=false

func _on_jogar_pressed():
	get_tree().change_scene("res://telamenu.tscn")
