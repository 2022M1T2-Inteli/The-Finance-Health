extends Node2D

func _random_market_item():
	return get_children()[randi() % get_children().size()].duplicate()
