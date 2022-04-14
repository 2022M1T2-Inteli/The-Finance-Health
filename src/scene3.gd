extends Node2D

var segundos = 00
var minutos = 00
var valor = 00
var d = 1
var gastos = 100
var investir = 0

	
func _ready():

	$m_1/din.text = String(Global.dinheiro)
	$Node/celular/abrir.visible = true
	$Node/celular/mensagem.visible = false
	$Node/celular/email.visible = false
	$Node/celular/tela_inicial.visible = false
	$Node/celular/ap_banco.visible = false
	$Player/CanvasLayer/dia.text = String(d)
	$Player/CanvasLayer/min.text = String(valor)
	$Player/CanvasLayer/hora.text = String(minutos)
	$Node/celular/poupanca.visible = false
	$Node/celular/ap_banco.visible = false
	$Node/celular/investiento.visible = false
	$Node/celular/tela_inicial.visible = false
	$Node/celular/mensagem.visible = false
	get_node("AudioStreamPlayer2D").play()

func _process(delta):
	$Player/CanvasLayer/min.text = String(Global.segundos)
	$Player/CanvasLayer/hora.text = String(Global.minutos)
	$Player/CanvasLayer/dia.text = String(Global.horas)
	$Node/celular/ap_banco/s_text.text = String(Global.dinheiro)
	
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
		
	if Global.minutos == 7:
		$Node/celular/mensagem/M1.text = str (Global.remetente[0])
		$Node/celular/mensagem/conteudoMensagem.text = str (Global.mensagem [0])
		
	







func _on_ent_pressed():
	$Node/celular/tela_inicial.visible = true
	$Node/celular/abrir.visible = false
	

func _on_b_banco_pressed():
	$Node/celular/abrir.visible = false
	$Node/celular/tela_inicial.visible = false
	$Node/celular/ap_banco.visible = true
	$Node/celular/email.visible = false


func _on_b_sair3_pressed():
	$Node/celular/ap_banco.visible = false
	$Node/celular/tela_inicial.visible = false
	$Node/celular/abrir.visible = true
	$Node/celular/email.visible = false


func _on_b_investimentos_pressed():
	$Node/celular/tela_inicial.visible = false
	$Node/celular/ap_banco.visible = false
	$Node/celular/poupanca.visible = false
	$Node/celular/investiento.visible = true
	$Node/celular/poupanca.visible = false
	$Node/celular/email.visible = false

func _on_poup_pressed():
	$Node/celular/tela_inicial.visible = false
	$Node/celular/ap_banco.visible = false
	$Node/celular/poupanca.visible = false
	$Node/celular/investiento.visible = false
	$Node/celular/poupanca.visible = true
	$Node/celular/email.visible = false

func _on_sair_pressed():
	$Node/celular/tela_inicial.visible = false
	$Node/celular/ap_banco.visible = false
	$Node/celular/poupanca.visible = false
	$Node/celular/investiento.visible = true
	$Node/celular/poupanca.visible = false
	$Node/celular/email.visible = false


func _on_sair__pressed():
	$Node/celular/abrir.visible = false
	$Node/celular/tela_inicial.visible = false
	$Node/celular/ap_banco.visible = true
	$Node/celular/email.visible = false

func _on_sair_in_pressed():
	$Node/celular/tela_inicial.visible = false
	$Node/celular/ap_banco.visible = true
	$Node/celular/poupanca.visible = false
	$Node/celular/investiento.visible = false
	$Node/celular/poupanca.visible = false
	$Node/celular/email.visible = false
	
	




	



func _on_Banco_body_exited(body):
	pass # Replace with function body.


func _on_b_email_pressed():
	$Node/celular/tela_inicial.visible = false
	$Node/celular/ap_banco.visible = false
	$Node/celular/poupanca.visible = false
	$Node/celular/investiento.visible = false
	$Node/celular/poupanca.visible = false
	$Node/celular/email.visible = true


func _on_sair_email_pressed():
	$Node/celular/tela_inicial.visible = true
	$Node/celular/abrir.visible = false
	$Node/celular/email.visible = false


func _on_sair_mensagem_pressed():
	$Node/celular/tela_inicial.visible = false
	$Node/celular/ap_banco.visible = false
	$Node/celular/poupanca.visible = false
	$Node/celular/investiento.visible = false
	$Node/celular/poupanca.visible = false
	$Node/celular/email.visible = true
	$Node/celular/mensagem.visible = false

func _on_abrir_mensagem_pressed():
	$Node/celular/email.visible = false
	$Node/celular/mensagem.visible = true

	
		
