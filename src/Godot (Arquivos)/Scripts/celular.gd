extends Node2D

func _ready():
	$Celular/email/Label.visible = false
	$invesitrbloqueado.visible = false
	if Global.recebeu_mensagem == true:
		$Celular/email/Label.visible = true
func _on_sair_pressed():
	get_tree().change_scene("res://"+Global.ultimaCena+".tscn")
	Global.teleporte = true

func _on_investir_pressed():
	if Global.conhecimento == 6:
		get_tree().change_scene("res://investir.tscn")
	else:
		$invesitrbloqueado.visible=true
		$invesitrbloqueado/Label.text = str("Investimentos bloqueados  Fale com todos os NPC's  ", Global.conhecimento,"/6")
		yield(get_tree().create_timer(5.0), "timeout")
		$invesitrbloqueado.visible=false

func _on_mapa_pressed():
	get_tree().change_scene("res://mapa.tscn")


func _on_email_pressed():
	get_tree().change_scene("res://email.tscn")
	Global.recebeu_mensagem = false
