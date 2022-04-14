extends Node2D

var investir = 0
var sacado = 0
var carteira = 0


func _ready():

	$bt_invest/inserir.visible = false
	$bt_sacar/sacar.visible = false
	$investido.text = str("R$" + str(Global.investido))
	$conta.text = str("R$" + str(Global.dinheiro))


func _on_bt_invest_pressed():
	$bt_invest/inserir.visible = true
	$bt_sacar/sacar.visible = false


func _on_ir_pressed():
	investir = int($bt_invest/inserir.text)
	if Global.dinheiro >= investir:
		Global.investido += investir
		$investido.text = str("R$" + str(Global.investido))
		Global.dinheiro -= int($bt_invest/inserir.text)
	$bt_invest/inserir.visible = false
	


func _on_bt_sacar_pressed():
	$bt_sacar/sacar.visible = true
	



func _on_sac_ir_pressed():
	if Global.investido >= int($bt_sacar/sacar.text):
		sacado = Global.investido - int($bt_sacar/sacar.text)
		$investido.text = str("R$" + str(sacado))
		Global.dinheiro += int($bt_sacar/sacar.text)
		Global.investido -= int($bt_sacar/sacar.text)
		$bt_sacar/sacar.visible = false
		
		
		 
func _process(delta):
	$investido.text = str("R$" + str(Global.investido))
	$conta.text = str("R$" + str(Global.dinheiro))
	
	if Global.minutos >= 50:
		if Global.investido >= 1:
			Global.investido +=1
			
	$investido.text = str("R$" + str(Global.investido))
		
func _on_Area2D_body_exited(body):
	get_tree().change_scene("res://scene3.tscn")
