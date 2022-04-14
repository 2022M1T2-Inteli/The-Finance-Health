extends Node2D

var txt1 = false
var dialog = ["Olá, sou a Amélia, atendente do mercado",
"Eu vejo a sua cara de descontentamento... a culpa não é minha. Os preços aumentaram de novo! A inflação aumentou!.",
"Você sabe o que é a inflação? A Inflação é o aumento persistente e generalizado no valor dos preços, ou seja se a inflação é de 10% os preços dos produtos aumentaram em 10% (ex: $ 10 para $ 11)"
 ]


func _ready():
	$music.play()
	$gameMerc/botao_game.visible = false
	
func _process(delta):
	

	$Player/CanvasLayer/dindin.text = String(Global.dinheiro)
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

func _on_Area2D_body_entered(body):
	$gameMerc/botao_game.visible = true
	print("passei")

func _on_boto_game_pressed():
	get_tree().change_scene("res://Minigame_Market/MarketGame.tscn")


func _on_gameMerc_body_exited(body):
	$gameMerc/botao_game.visible = false
