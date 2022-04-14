extends Node2D

func _ready():
	$trivia/botaotrivia.visible = false
	$Sleep/GoSleep.visible = false
	$Bath/GoBath.visible = false
	$Player/CanvasLayer/ColorRect.visible = false
	$Player/CanvasLayer/MenuButton/Instrucao.visible = false
	
	_seta_conhecimento()
	_seta_cor()
	
	
func _process(delta):

	$Player/CanvasLayer/h.text = str(str(Global.horas)+"h"+str(Global.minutos))
	$Player/CanvasLayer/dia.text = str("Dia "+str(Global.dias))
	$TileMap/compquarto/AnimationPlayer.play("comp quarto")
	$bathroom/sink/AnimationPlayer.play("sink")
	$TileMap/sistemacomp2/AnimationPlayer.play("sistema de comp")
	$layer2/fogo/AnimationPlayer.play("fogo")
	$layer2/portacasa/AnimationPlayer.play("porta casa")
	$bathroom/banheira/AnimationPlayer.play("banheira")
	$bathroom/mirror/AnimationPlayer.play("mirror")
	$bedroomlayer/TV/AnimationPlayer.play("TV")
	$bedroomlayer/aquario/AnimationPlayer.play("aquario")
	$TileMap/sistemacomp/AnimationPlayer.play("sistema de comp")
	$layer2/cat/AnimationPlayer.play("cat")
	
func _seta_conhecimento():
	if Global.conhecimento == 6:
		$seta.visible = true
		$seta2.visible = true
	else:
		$seta.visible = false
		$seta2.visible = false
		
func _seta_cor():
	if Global.vermelho or Global.azul or Global.verde or Global.amarelo:
		$seta3.visible = true
	else:
		$seta3.visible = false

func _on_trivia_body_entered(body):
	if Global.conhecimento == 6:
		$trivia/botaotrivia.visible = true 

func _on_trivia_body_exited(body):
	$trivia/botaotrivia.visible = false

func _on_botaotrivia_pressed():
	get_tree().change_scene("res://triviacerto.tscn")


func _on_Sleep_body_entered(body):
	if Global.horas >= 21 or Global.horas < 5:
		$Sleep/GoSleep.visible = true

func _on_Sleep_body_exited(body):
	$Sleep/GoSleep.visible = false

func _on_GoSleep_pressed():
	$Player/CanvasLayer/ColorRect.visible = true
	$Player/CanvasLayer/ColorRect/AnimationPlayer.play("GoSleep")

func _time_advance():
	if Global.horas >= 21 and Global.horas < 24:
		Global.horas = 5
		Global.dias += 1
	elif Global.horas >= 0 and Global.horas < 5:
		Global.horas = 5
	$Player/CanvasLayer/ColorRect/AnimationPlayer.play("OutSleep")


func _on_Bath_body_entered(body):
	if body.name == "Player":
		$Bath/GoBath.visible = true

func _on_Bath_body_exited(body):
	if body.name == "Player":
		$Bath/GoBath.visible = false

func _on_GoBath_pressed():
	Global.vermelho = false
	Global.azul = false
	Global.verde = false
	Global.amarelo = false
	$Player/Sprite.modulate = "ffffff"

func _on_MenuButton_mouse_entered():
	$Player/CanvasLayer/MenuButton/Instrucao.visible = true


func _on_MenuButton_mouse_exited():
	$Player/CanvasLayer/MenuButton/Instrucao.visible = false


func _on_BibliotecaEntrar_pressed():
	get_tree().change_scene("res://Biblioteca.tscn")
