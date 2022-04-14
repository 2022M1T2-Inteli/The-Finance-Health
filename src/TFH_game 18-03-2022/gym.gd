extends Node2D


var segundos = 00
var minutos = 00
var valor = 00
var d = 1
var money = 1.5
var gastos = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	$m_1/money_text.text = String(Global.dinheiro)
	$Player/CanvasLayer/min.text = String(Global.segundos)
	$Player/CanvasLayer/hora.text = String(Global.minutos)
	$Player/CanvasLayer/dia.text = String(Global.horas)
	
	
	Global.sent += delta
	
	if Global.sent >= 0.5:
		Global.segundos +=1
		Global.sent = 00
		$Player/CanvasLayer/min.text = String(Global.segundos)
		
	if Global.segundos == 60:
		Global.segundos = 00
		Global.minutos += 1
		$Player/CanvasLayer/hora.text = String(Global.minutos)
		
	if Global.minutos == 24:
		Global.minutos = 00
		Global.horas += 1
		$Player/CanvasLayer/dia.text = String(Global.horas)
		


	
