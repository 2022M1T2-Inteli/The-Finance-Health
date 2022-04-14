extends Node2D

var preco_viagem = 5 * Global.inflacao

func _process(delta):
	$dindin.text = str(round(Global.dinheiro))
	$Price.text = str(round(preco_viagem))

func _on_Button_pressed():
	Global.dinheiro -= preco_viagem
	get_tree().change_scene("res://celular.tscn")

func _on_casa_pressed():
	Global.dinheiro -= preco_viagem
	get_tree().change_scene("res://casa.tscn")
	Global.mudarcena=true
	Global.cena=Vector2(407,245)

func _on_academia_pressed():
	Global.dinheiro -= preco_viagem
	get_tree().change_scene("res://academia.tscn")
	Global.mudarcena=true
	Global.cena=Vector2(424,233)

func _on_banco_pressed():
	Global.dinheiro -= preco_viagem
	get_tree().change_scene("res://banco.tscn")
	Global.mudarcena=true
	Global.cena=Vector2(48,95)

func _on_mercado_pressed():
	Global.dinheiro -= preco_viagem
	get_tree().change_scene("res://mercado.tscn")
	Global.mudarcena=true
	Global.cena=Vector2(415,35)
