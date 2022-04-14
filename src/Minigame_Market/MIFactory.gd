extends Node2D

var Factory = preload("res://Minigame_Market/MarketItemFactory.tscn")

func _on_Timer_timeout():
	var FAC = Factory.instance()
	var market_item = FAC._random_market_item()
	add_child(market_item)
