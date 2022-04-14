extends Node2D

func _ready():
	$bt_investir/inserir.visible=false
	$bt_sacar/sacar.visible=false
	$MenuButton/CDBInfo.visible = false

func _process(delta):
	$conta.text = str("R$" + str(stepify(Global.dinheiro, 0.01)))
	$investido.text = str("R$" + str(stepify(Global.cdb, 0.01)))

func _on_bt_investir_pressed():
	$bt_investir/inserir.visible=true


func _on_enviar_pressed():
	if Global.dinheiro >= int($bt_investir/inserir.text):
		Global.cdb += int($bt_investir/inserir.text)
		Global.dinheiro -= int($bt_investir/inserir.text)
		$investido.text = str("R$" + str(Global.cdb))
	$bt_investir/inserir.visible = false
	
	


func _on_bt_sacar_pressed():
	$bt_sacar/sacar.visible=true


func _on_enviarsacar_pressed():
	if Global.cdb >= int($bt_sacar/sacar.text):
		Global.dinheiro += int($bt_sacar/sacar.text)
		Global.cdb -= int($bt_sacar/sacar.text)
		$conta.text = str("R$" + str(Global.dinheiro))
	$bt_sacar/sacar.visible = false


func _on_sair_pressed():
	get_tree().change_scene("res://escolher_invest.tscn")


func _on_MenuButton_mouse_entered():
	$MenuButton/CDBInfo.visible = true


func _on_MenuButton_mouse_exited():
	$MenuButton/CDBInfo.visible = false
