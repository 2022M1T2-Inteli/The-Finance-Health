class_name Player
extends KinematicBody2D

export var ACCELERATION = 350
export var FRICTION = 850
export var MAX_SPEED = 100
export var ROLL_SPEED = 180
var felicidade = 100
var posicao = [Vector2(424,233), Vector2(415,35), Vector2(-12,-30), Vector2(-27,-333), Vector2(48,95), Vector2(407,245),
Vector2(405,-380), Vector2(-90,-40), Vector2(51,447), Vector2(77,-37), Vector2(150, 250), Vector2(-200, -32)]

var POPUP = false

enum {
	RUN,
	ROLL,
	JUMP,
}

onready var animation_tree = $AnimationTree
onready var animation_state = animation_tree.get("parameters/playback")

var velocity = Vector2.ZERO
var roll_vector = Vector2.DOWN
var state = RUN
var roll_finished = false
var targets = []

func _ready():
	$CanvasLayer/celular/notificacao.visible = false
	animation_tree.active = true
	if Global.teleporte == true:
		self.position = Global.lastPosition
	if Global.mudarcena == true:
		self.position = Global.cena
	if Global.minigameMARKETsaida == true:
		self.position = Vector2(504, 127)
	if Global.minigameGYMsaida == true:
		self.position = Vector2(306, 200)
	if Global.casaTRIVIAsaida == true:
		self.position = Vector2(102, 130)

func _physics_process(delta):
	match state:
		RUN:	
			run_state(delta)
		ROLL:
			roll_state(delta)
		JUMP:
			jump_state(delta)
	
func run_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		roll_vector = input_vector
		animation_tree.set("parameters/Idle/blend_position", input_vector)
		animation_tree.set("parameters/Run/blend_position", input_vector)
		animation_tree.set("parameters/Jump/blend_position", input_vector)
		animation_tree.set("parameters/Roll/blend_position", input_vector)
		animation_state.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animation_state.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)

	velocity = move_and_slide(velocity)
	
	if velocity.length() > 0 && Input.is_action_just_pressed("roll"):
		state = ROLL
		Global.BarraSaude -= 1
		roll_finished = false
	elif velocity.length() == 0 && Input.is_action_just_pressed("jump"):
		state = JUMP
		
func roll_state(delta):
	if !roll_finished:
		velocity = roll_vector * ROLL_SPEED
	else:
		velocity = velocity * 0.9
	animation_state.travel("Roll")
	velocity = move_and_slide(velocity)
	
func jump_state(delta):
	animation_state.travel("Jump")
	velocity = move_and_slide(velocity)
	
	
func roll_prefinished():
	roll_finished = true
	
func roll_finished():
	state = RUN
	velocity = velocity * 0.5
	
func _process(delta):
	$CanvasLayer/conhecimento.text = str(Global.conhecimento, "/6")
	if Global.conhecimento == 6:
		$CanvasLayer/conhecimento.visible=false
		
	if Global.BarraSaude <= 0:
		Global.dinheiro -= Global.dinheiro/2
		Global.BarraSaude = 100
		Global.BarraFelicidade = 100
		get_tree().change_scene("res://perdeu.tscn")
	
	$CanvasLayer/ControlBarMoney/dindin.text = str(round(Global.dinheiro))
	$CanvasLayer/ControlBarMoney/Happy.value = Global.BarraFelicidade
	$CanvasLayer/ControlBarMoney/life.value = Global.BarraSaude
	Global.BarraFelicidade -= float(Global.MenosFelicidade)
	if Global.BarraFelicidade <= 30:
		Global.BarraSaude -= float(Global.MenosSaude)
	
	Global.segundos += delta
	
	if Global.segundos >= 0.3:
		Global.minutos +=1
		Global.segundos = 00
		
	if Global.minutos == 60:
		Global.minutos = 00
		Global.horas += 1

	if Global.horas == 24:
		Global.horas = 00
		Global.dias += 1
		
	if Global.horas ==20 && Global.minutos == 1 && Global.segundos == 0:
		Global.inflacao = Global.inflacao * 1.04
		if Global.cdb >= 1:
			Global.cdb += stepify(Global.cdb*0.05, 0.01)
		if Global.investido >= 1:
			Global.investido += stepify(Global.investido*0.02, 0.01)
		
	
	_mensagens_diarias()
	_mensagens_eventos()
	_popup()
	
	_change_color()
	


func _mensagens_diarias():
	if Global.dias == 1 && Global.horas == 6 && Global.minutos == 30 && Global.segundos == 0:
		Global.recebeu_mensagem = true
		POPUP = true
		Global.remetente1 = Global.remetente[0]
		Global.conteudo = Global.mensagem[0]
		if Global.recebeu_mensagem:
			$CanvasLayer/celular/notificacao.visible = true
		if !Global.recebeu_mensagem:
			$CanvasLayer/celular/notificacao.visible = false
		
	if Global.dias == 1 && Global.horas == 10 && Global.minutos == 0 && Global.segundos == 0:
		Global.recebeu_mensagem = true
		POPUP = true
		Global.remetente1 = Global.remetente[2]
		Global.conteudo = Global.mensagem[2]
		if Global.recebeu_mensagem:
			$CanvasLayer/celular/notificacao.visible = true
		if !Global.recebeu_mensagem:
			$CanvasLayer/celular/notificacao.visible = false
		
	if Global.dias == 2 && Global.horas == 8 && Global.minutos == 0 && Global.segundos == 0:
		Global.recebeu_mensagem = true
		POPUP = true
		Global.remetente1 = Global.remetente[1]
		Global.conteudo = Global.mensagem[1]
		if Global.recebeu_mensagem:
			$CanvasLayer/celular/notificacao.visible = true
		if !Global.recebeu_mensagem:
			$CanvasLayer/celular/notificacao.visible = false
func _mensagens_eventos():
	
	if Global.vermelho or Global.azul or Global.verde or Global.amarelo:
		if Global.contagem == 0:
			Global.contagem += 1
			Global.recebeu_mensagem = true
			POPUP = true
			Global.remetente1 = Global.remetente[3]
			Global.conteudo = Global.mensagem_evento[0]
			if Global.recebeu_mensagem:
				$CanvasLayer/celular/notificacao.visible = true
			if !Global.recebeu_mensagem:
				$CanvasLayer/celular/notificacao.visible = false
	
	if Global.conhecimento == 6:
		if Global.contagem1 == 0:
			Global.contagem1 += 1
			Global.recebeu_mensagem = true
			POPUP = true
			Global.remetente1 = Global.remetente[0]
			Global.conteudo = Global.mensagem_evento[1]
			if Global.recebeu_mensagem:
				$CanvasLayer/celular/notificacao.visible = true
			if !Global.recebeu_mensagem:
				$CanvasLayer/celular/notificacao.visible = false
				
	if Global.BarraFelicidade <= 50:
		if Global.contagemFelicidade == 0:
			Global.contagemFelicidade += 1
			Global.recebeu_mensagem = true
			POPUP = true
			Global.remetente1 = Global.remetente[4]
			Global.conteudo = Global.mensagem_evento[2]
			if Global.recebeu_mensagem:
				$CanvasLayer/celular/notificacao.visible = true
			if !Global.recebeu_mensagem:
				$CanvasLayer/celular/notificacao.visible = false
	
	if Global.BarraSaude <= 70:
		if Global.contagemSaude == 0:
			Global.contagemSaude += 1
			Global.recebeu_mensagem = true
			POPUP = true
			Global.remetente1 = Global.remetente[2]
			Global.conteudo = Global.mensagem_evento[3]
			if Global.recebeu_mensagem:
				$CanvasLayer/celular/notificacao.visible = true
			if !Global.recebeu_mensagem:
				$CanvasLayer/celular/notificacao.visible = false
				
func _popup():
	if POPUP:
		POPUP = false
		$popup.play()

func _change_color():
	
	if Global.vermelho:
		$Sprite.modulate = "ff0000"
	if Global.azul:
		$Sprite.modulate = "004aff"
	if Global.verde:
		$Sprite.modulate = "00ff05"
	if Global.amarelo:
		$Sprite.modulate = "ffff00"


func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://academia.tscn")
	Global.cena = posicao[0]
	Global.mudarcena=true
	Global.minigameGYMsaida=false
	Global.minigameMARKETsaida=false
	Global.casaTRIVIAsaida=false
func _on_mercado_body_entered(body):
	get_tree().change_scene("res://mercado.tscn")
	Global.cena = posicao[1]
	Global.mudarcena=true

func _on_mercSaida_body_entered(body):
	get_tree().change_scene("res://scene3.tscn")
	Global.cena = posicao[2]
	Global.mudarcena=true
	Global.minigameGYMsaida=false
	Global.minigameMARKETsaida=false
	Global.casaTRIVIAsaida=false
func _on_saida_Gym_body_entered(body):
	get_tree().change_scene("res://scene3.tscn")
	Global.cena = posicao[3]
	Global.mudarcena=true
	Global.minigameGYMsaida=false
	Global.minigameMARKETsaida=false
	Global.casaTRIVIAsaida=false
func _on_Banco_body_entered(body):
	get_tree().change_scene("res://banco.tscn")
	Global.cena = posicao[4]
	Global.mudarcena=true
	Global.minigameGYMsaida=false
	Global.minigameMARKETsaida=false
	Global.casaTRIVIAsaida=false
func _on_casa_body_entered(body):
	get_tree().change_scene("res://casa.tscn")
	Global.cena = posicao[5]
	Global.mudarcena=true
	Global.minigameGYMsaida=false
	Global.minigameMARKETsaida=false
	Global.casaTRIVIAsaida=false

func _on_MenuButton_mouse_entered():
	$CanvasLayer/MenuButton/PopEntrada.visible = true


func _on_MenuButton_mouse_exited():
	$CanvasLayer/MenuButton/PopEntrada.visible = false

func _on_banco_saida_body_entered(body):
	get_tree().change_scene("res://scene3.tscn")
	Global.cena = posicao[6]
	Global.mudarcena=true
	Global.minigameGYMsaida=false
	Global.minigameMARKETsaida=false
	Global.casaTRIVIAsaida=false
func _on_casasaida_body_entered(body):
	get_tree().change_scene("res://scene3.tscn")
	Global.cena = posicao[7]
	Global.mudarcena=true
	Global.minigameGYMsaida=false
	Global.minigameMARKETsaida=false
	Global.casaTRIVIAsaida=false
func _on_cenaCelular_pressed():
	get_tree().change_scene("res://celular.tscn")
	Global.ultimaCena = get_tree().get_current_scene().get_name()
	$CanvasLayer/celular/notificacao.visible = false
	Global.lastPosition = self.global_position
	Global.mudarcena=false
	Global.minigameGYMsaida=false
	Global.minigameMARKETsaida=false
	Global.casaTRIVIAsaida=false
func _on_Area2D2_body_entered(body):
	get_tree().change_scene("res://clothing_store.tscn")
	Global.cena = posicao[8]
	Global.mudarcena=true
	Global.minigameGYMsaida=false
	Global.minigameMARKETsaida=false
	Global.casaTRIVIAsaida=false
func _on_saidaloja_body_entered(body):
	get_tree().change_scene("res://scene3.tscn")
	Global.cena = posicao[9]
	Global.mudarcena=true
	Global.minigameGYMsaida=false
	Global.minigameMARKETsaida=false
	Global.casaTRIVIAsaida=false
func _on_Area2D_Museu_body_entered(body):
	get_tree().change_scene("res://museu.tscn")
	Global.cena = posicao[10]
	Global.mudarcena=true
	Global.minigameGYMsaida=false
	Global.minigameMARKETsaida=false
	Global.casaTRIVIAsaida=false
func _on_Area2D_saida_museu_body_entered(body):
	get_tree().change_scene("res://scene3.tscn")
	Global.cena = posicao[11]
	Global.mudarcena=true
	Global.minigameGYMsaida=false
	Global.minigameMARKETsaida=false
	Global.casaTRIVIAsaida=false
