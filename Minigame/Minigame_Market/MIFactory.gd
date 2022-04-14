extends Node2D

var timer = 0

var Factory = preload("res://Minigame/Minigame_Market/MarketItemFactory.tscn")

func _process(delta):
	var sent 
	timer += 1

func _on_Timer_timeout():
	var FAC = Factory.instance()
	var market_item = FAC._random_market_item()
	add_child(market_item)
