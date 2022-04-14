extends Node

onready var br = preload("res://tijolos.tscn")
var decimos = 0
var segundos = 0 
var minutos = 0

func _ready():
	coloca_tijolo()

func coloca_tijolo():
	var numtijolos = 0
	for i in range (4):
		for j in range(14):
			var tijolo = br.instance()
			tijolo.position = Vector2(90+65*(j), 90+50*i)
			numtijolos += 1
			add_child(tijolo)

func _process(delta):
	if Global.tijolos >= 56:
		get_tree().change_scene("res://final_jogo_banco.tscn")
		Global.dinheirojogo = 75 * (1000/(segundos + minutos*60))
	_relogio()
	if Global.comecoutrabalho == true:
		decimos += delta
	
	if decimos >= 1:
		segundos += 1 
		decimos = 0 
	if segundos >= 60:
		minutos += 1 
		segundos =0
		

func _relogio():
	if segundos < 10:
		$relogio.text = str(minutos,":0",segundos)
	else:
		$relogio.text = str(minutos,":",segundos)
		

func _on_sair_trabalho_pressed():
	get_tree().change_scene("res://banco.tscn")
