extends Node2D

var Factory = preload("res://Minigame/Minigame_Market/MarketItemFactory.tscn")
var sent = 0
var timer = 0
var increase = 4
var game = true

func _process(delta):
	$CanvasLayer/ControlBarMoney/dindin.text = (str(round(Global.dinheiro)))
	$CanvasLayer/ControlBarMoney/Happy.value = Global.BarraFelicidade
	$CanvasLayer/ControlBarMoney/life.value = Global.BarraSaude
	
	if timer >= 60:
			game = false
	if game:
		sent += delta
		if sent >= 3 / Global.fruits_count:
			timer += 1
			var FAC = Factory.instance()
			var market_item = FAC._random_market_item()
			add_child(market_item)
			sent = 0
			Global.fruits_count += 0.03
	else:
		sent = 0
		Global.fruits_count = 1


func _on_exit_minigame_pressed():
	Global.minigameMARKETsaida = true
	get_tree().change_scene("res://mercado.tscn")
