extends Node2D

var Factory = preload("res://Minigame/Minigame_Gym/GymItemFactory.tscn")
var sent = 0
var button = 0

func _ready():
	$CanvasLayer2/GameOver.visible = false
	$CanvasLayer2/ControlBarMoney.visible = false
	$CanvasLayer2/Pontuacao.visible = false
	$CanvasLayer2/PontuacaoRecord.visible = false
	$CanvasLayer2/GameOverPlayer.visible = false
	$Pontos.visible = true
	$AudioStreamPlayer2D2.play()
	Global.game = true
	if Global.vermelho:
		$CanvasLayer2/GameOverPlayer/Sprite.modulate = "ff0000"
	if Global.azul:
		$CanvasLayer2/GameOverPlayer/Sprite.modulate = "004aff"
	if Global.verde:
		$CanvasLayer2/GameOverPlayer/Sprite.modulate = "00ff05"
	if Global.amarelo:
		$CanvasLayer2/GameOverPlayer/Sprite.modulate = "ffff00"

func _input(event):
	if Input.is_action_pressed("ui_accept") or Input.is_action_pressed("ui_up"):
		Global.game = true

func _process(delta):
	$CanvasLayer2/ControlBarMoney/dindin.text = String("R$"+str((round(Global.dinheiro))))
	$Pontos.text = (str(Global.gym_points))
	$CanvasLayer2/Pontuacao.text = String("PONTUAÇÃO: "+str(Global.gym_points))
	$CanvasLayer2/PontuacaoRecord.text = String("RECORDE: "+str(Global.gym_record_points))
	$CanvasLayer2/ControlBarMoney/happy.value = Global.BarraFelicidade
	$CanvasLayer2/GameOver/Restart/Label.text = String("R$"+str(round(Global.ValorAcademia * Global.inflacao)))
	
	if Global.game:
		sent += delta
		$StaticBody2D/AnimationPlayer.play("Ground_Move")
		if sent >= 3 / Global.gym_count:
			var FAC = Factory.instance()
			var gym_item = FAC._random_gym_item()
			add_child(gym_item)
			sent = 0
			Global.gym_count += 0.03
		if Global.gym_count >= 60:
			Global.gym_count = 60
	else:
		sent = 0
		Global.gym_count = 1
		$StaticBody2D/AnimationPlayer.play("RESET")
	
	_end_game()
	
	_recorde()
	

func _end_game():
	if Global.end_game:
		$CanvasLayer2/GameOver.visible = true
		$CanvasLayer2/ControlBarMoney.visible = true
		$CanvasLayer2/GameOver/Restart/Label.visible = true
		$CanvasLayer2/Pontuacao.visible = true
		$CanvasLayer2/PontuacaoRecord.visible = true
		$CanvasLayer2/GameOverPlayer.visible = true
		$AudioStreamPlayer2D2.stream_paused = true
		$CanvasLayer2/GameOver/Restart.disabled = false
		
	else:
		$CanvasLayer2/GameOver.visible = false
		$CanvasLayer2/ControlBarMoney.visible = false
		$CanvasLayer2/GameOver/Restart/Label.visible = false
		$CanvasLayer2/Pontuacao.visible = false
		$CanvasLayer2/PontuacaoRecord.visible = false
		$CanvasLayer2/GameOverPlayer.visible = false
		$AudioStreamPlayer2D2.stream_paused = false
		

func _recorde():
	if Global.gym_points > Global.gym_record_points:
		Global.gym_record_points = Global.gym_points



func _on_ExitButton_pressed():
	Global.gym_points = 0
	Global.end_game = false
	Global.minigameGYMsaida = true
	get_tree().change_scene("res://academia.tscn")


func _on_Restart_pressed():
	button += 1
	if button == 1:
		Global.end_game = false
		Global.dinheiro -= round(Global.ValorAcademia * Global.inflacao)
		Global.gym_points = 0
		$CanvasLayer2/GameOver/Restart.disabled = true
		button = 0
