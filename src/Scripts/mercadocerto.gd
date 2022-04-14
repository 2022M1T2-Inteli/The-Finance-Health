extends Node2D

var play = false

func _ready():
	$music.play()
	$gameMerc/botao_game.visible = false
	$Player/CanvasLayer/dia.text = str("Dia "+str(Global.dias))
	$Player/CanvasLayer/h.text = str(str(Global.horas) +"h"+ str(Global.minutos))
	$Player/CanvasLayer/Tutorial.visible = false
	$Player/CanvasLayer/OfertasdoDia.visible = false
	
	$Player/CanvasLayer/OfertasdoDia/MenuMaca/ControlMINFO.visible = false
	$Player/CanvasLayer/OfertasdoDia/MenuMacaV/ControlMINFO.visible = false
	$Player/CanvasLayer/OfertasdoDia/MenuLeite/ControlMINFO.visible = false
	$Player/CanvasLayer/OfertasdoDia/MenuSuco/ControlMINFO.visible = false
	$Player/CanvasLayer/OfertasdoDia/MenuPao/ControlMINFO.visible = false
	$Player/CanvasLayer/OfertasdoDia/MenuAveia/ControlMINFO.visible = false
func _process(delta):
	
	$Player/CanvasLayer/dia.text = str("Dia "+str(Global.dias))
	$Player/CanvasLayer/h.text = str(str(Global.horas) +"h"+ str(Global.minutos))

	_ofertas_do_dia_display()

	$Player/CanvasLayer/OfertasdoDia/MenuMaca/ControlMINFO/Price.text = str((round(1 * Global.inflacao)))
	$Player/CanvasLayer/OfertasdoDia/MenuMaca/ControlMINFO/PlusLife.text = str(15)
	$Player/CanvasLayer/OfertasdoDia/MenuMacaV/ControlMINFO/Price.text = str((round(2 * Global.inflacao)))
	$Player/CanvasLayer/OfertasdoDia/MenuMacaV/ControlMINFO/PlusLife.text = str(20)
	$Player/CanvasLayer/OfertasdoDia/MenuLeite/ControlMINFO/Price.text = str((round(6 * Global.inflacao)))
	$Player/CanvasLayer/OfertasdoDia/MenuLeite/ControlMINFO/PlusLife.text = str(40)
	$Player/CanvasLayer/OfertasdoDia/MenuSuco/ControlMINFO/Price.text = str((round(8 * Global.inflacao)))
	$Player/CanvasLayer/OfertasdoDia/MenuSuco/ControlMINFO/PlusLife.text = str(50)
	$Player/CanvasLayer/OfertasdoDia/MenuPao/ControlMINFO/Price.text = str((round(10 * Global.inflacao)))
	$Player/CanvasLayer/OfertasdoDia/MenuPao/ControlMINFO/PlusLife.text = str(60)
	$Player/CanvasLayer/OfertasdoDia/MenuAveia/ControlMINFO/Price.text = str((round(15 * Global.inflacao)))
	$Player/CanvasLayer/OfertasdoDia/MenuAveia/ControlMINFO/PlusLife.text = str(75)


func _ofertas_do_dia_display():
	if Global.market_instrunction:
		$Player/CanvasLayer/OfertasdoDia.visible = true
	else:
		$Player/CanvasLayer/OfertasdoDia.visible = false


func _on_Area2D_body_entered(body):
	$gameMerc/botao_game.visible = true

func _on_boto_game_pressed():
	$Player/CanvasLayer/Tutorial.visible = true

func _on_PlayMarket_pressed():
	get_tree().change_scene("res://Minigame/Minigame_Market/MarketGame.tscn")


func _on_gameMerc_body_exited(body):
	$gameMerc/botao_game.visible = false
	$Player/CanvasLayer/Tutorial.visible = false



func _on_MenuMaca_mouse_entered():
	$Player/CanvasLayer/OfertasdoDia/MenuMaca/ControlMINFO.visible = true
	
func _on_MenuMacaV_mouse_entered():
	$Player/CanvasLayer/OfertasdoDia/MenuMacaV/ControlMINFO.visible = true

func _on_MenuLeite_mouse_entered():
	$Player/CanvasLayer/OfertasdoDia/MenuLeite/ControlMINFO.visible = true

func _on_MenuSuco_mouse_entered():
	$Player/CanvasLayer/OfertasdoDia/MenuSuco/ControlMINFO.visible = true

func _on_MenuPao_mouse_entered():
	$Player/CanvasLayer/OfertasdoDia/MenuPao/ControlMINFO.visible = true

func _on_MenuAveia_mouse_entered():
	$Player/CanvasLayer/OfertasdoDia/MenuAveia/ControlMINFO.visible = true


func _on_MenuMaca_mouse_exited():
	$Player/CanvasLayer/OfertasdoDia/MenuMaca/ControlMINFO.visible = false

func _on_MenuMacaV_mouse_exited():
	$Player/CanvasLayer/OfertasdoDia/MenuMacaV/ControlMINFO.visible = false

func _on_MenuLeite_mouse_exited():
	$Player/CanvasLayer/OfertasdoDia/MenuLeite/ControlMINFO.visible = false

func _on_MenuSuco_mouse_exited():
	$Player/CanvasLayer/OfertasdoDia/MenuSuco/ControlMINFO.visible = false

func _on_MenuPao_mouse_exited():
	$Player/CanvasLayer/OfertasdoDia/MenuPao/ControlMINFO.visible = false

func _on_MenuAveia_mouse_exited():
	$Player/CanvasLayer/OfertasdoDia/MenuAveia/ControlMINFO.visible = false


func _on_exit_ofertas_pressed():
	Global.market_instrunction = false




