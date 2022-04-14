extends Node2D
onready var errou = get_node("Pop-Up-SemTransicao(Efeito)")
var contador = 0
var lista = ["A inflação corrói o poder de compra do consumidor a medida que o tempo passa.", "O CDB é um investimento de renda variável", "A poupança costuma render mais do que o CDB", "A taxa selic é fundamental para os investimentos de renda fixa","Acabou"]
var timeout = false
var end = false 
var erro = 0
var pontuacao = 0
func _ready():
	$Labelp1.text = lista[0]
	get_node("Pop-Up-SemTransicao(Efeito)").visible = false 
	get_node("Exit").visible = false

	

func _on_play_pressed():
	$telamenu.visible = false
	
	
	
func _on_Buttonafimat_pressed():
	if erro == 0: 
		contador += 1
		$Labelp1.text = lista[1]
		erro += 1
	elif erro == 1:
		get_node("Pop-Up-SemTransicao(Efeito)").visible = true 
		yield(get_tree().create_timer(1),"timeout")
		get_node("Pop-Up-SemTransicao(Efeito)").visible = false
		
	elif erro == 2:
		get_node("Pop-Up-SemTransicao(Efeito)").visible = true 
		yield(get_tree().create_timer(1),"timeout")
		get_node("Pop-Up-SemTransicao(Efeito)").visible = false 
	elif erro == 3:
		$Labelp1.text = lista[4]
		get_node("Exit").visible = true
		

func _on_Buttonnegat_pressed():
	if contador == 0: 
		get_node("Pop-Up-SemTransicao(Efeito)").visible = true 
		yield(get_tree().create_timer(1),"timeout")
		get_node("Pop-Up-SemTransicao(Efeito)").visible = false
	elif contador == 1:
		$Labelp1.text = lista[2]
		contador += 1 
		erro += 1
	elif contador == 2:
		$Labelp1.text = lista[3]
		contador += 1 
		erro += 1
	elif contador == 3:
		get_node("Pop-Up-SemTransicao(Efeito)").visible = true 
		yield(get_tree().create_timer(1),"timeout")
		get_node("Pop-Up-SemTransicao(Efeito)").visible = false 


func _on_saida_pressed():
	Global.casaTRIVIAsaida = true
	get_tree().change_scene("res://casa.tscn")


func _on_saida1_pressed():
	Global.casaTRIVIAsaida = true
	get_tree().change_scene("res://casa.tscn")

