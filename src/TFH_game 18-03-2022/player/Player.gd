class_name Player
extends KinematicBody2D

export var ACCELERATION = 350
export var FRICTION = 850
export var MAX_SPEED = 100
export var ROLL_SPEED = 180
var felicidade = 100
var remetente = ["Dr.Gomes","Amélia"]
var mensagem = ["Olá, Player. Hoje os produtos estão em promoção, aproveite para fazer compras"]



enum {
	RUN,
	ROLL,
	JUMP,
	MINING,
	WOODCUTTING
}

onready var animation_tree = $AnimationTree
onready var animation_state = animation_tree.get("parameters/playback")

var velocity = Vector2.ZERO
var roll_vector = Vector2.DOWN
var state = RUN
var roll_finished = false
var targets = []


func _ready():

	animation_tree.active = true
	if Global.teleporte == true:
		self.position = Global.lastPosition+Vector2(10,10)
	if Global.cenagym == true:
		self.position = Vector2(424,233)
	if Global.mercado == true:
		self.position = Vector2(415,35)
	if Global.mercSaida == true:
		self.position =Vector2(-12,-43)
	if Global.gynsaida == true:
		self.position =Vector2(-27,-333)
	if Global.banco == true:
		self.position=Vector2(48,95)
	if Global.bancosaida == true:
		self.position=Vector2(405,-380)
	if Global.casasaida == true:
		self.position=Vector2(-90,-40)
	if Global.casa == true:
		self.position=Vector2(407,245)
	

func _physics_process(delta):
	match state:
		RUN:	
			run_state(delta)
		ROLL:
			roll_state(delta)
		JUMP:
			jump_state(delta)
		MINING:
			mining_state(delta)
		WOODCUTTING:
			woodcutting_state(delta)
	
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
		animation_tree.set("parameters/Woodcutting/blend_position", input_vector)
		animation_tree.set("parameters/Mining/blend_position", input_vector)
		animation_state.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animation_state.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)

	velocity = move_and_slide(velocity)
	
	if velocity.length() > 0 && Input.is_action_just_pressed("roll"):
		state = ROLL
		roll_finished = false
	elif velocity.length() == 0 && Input.is_action_just_pressed("jump"):
		state = JUMP
	elif velocity.length() == 0 && Input.is_action_pressed("action"):
		if is_tree_infront():
			state = WOODCUTTING
		elif is_rock_infront():
			state = MINING
	
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
	
func mining_state(delta):
	animation_state.travel("Mining")
	velocity = move_and_slide(velocity)
	
func woodcutting_state(delta):
	animation_state.travel("Woodcutting")
	velocity = move_and_slide(velocity)

func animation_finished():
	if !Input.is_action_pressed("action"):
		state = RUN
		velocity = Vector2.ZERO
	
func roll_prefinished():
	roll_finished = true
	
func roll_finished():
	state = RUN
	velocity = velocity * 0.5
	
func on_target_hit() -> void:
	for target in targets:
		target.hit()
		
func is_tree_infront():
	for target in targets:
		if target is TreeTarget:
			return true
	return false
	
func is_rock_infront():
	for target in targets:
		if target is RockTarget:
			return true
	return false

func _on_Hitbox_body_entered(body):
	targets.append(body)

func _on_Hitbox_body_exited(body):
	targets.erase(body)
	
func _process(delta):

	felicidade = get_node("CanvasLayer/ProgressBar")
	felicidade.value -= float(0.01)
	
		
	if felicidade.value <= 0:
		felicidade = 100
		get_node("CanvasLayer/ProgressBar").value = 100




func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://gym.tscn")
	Global.mercSaida = false
	Global.mercado=false
	Global.cenagym=true
	Global.gynsaida=false
	Global.teleporte=false
	Global.casa=false
	Global.casasaida=false
	Global.banco=false
	Global.bancosaida=false


func _on_mercado_body_entered(body):
	get_tree().change_scene("res://mercadocerto.tscn")
	Global.mercSaida = false
	Global.mercado=true
	Global.cenagym=false
	Global.gynsaida=false
	Global.teleporte=false
	Global.casa=false
	Global.casasaida=false
	Global.banco=false
	Global.bancosaida=false


func _on_mercSaida_body_entered(body):
	get_tree().change_scene("res://scene3.tscn")
	Global.mercSaida = true
	Global.mercado=false
	Global.cenagym=false
	Global.gynsaida=false
	Global.teleporte=false
	Global.casa=false
	Global.casasaida=false
	Global.banco=false
	Global.bancosaida=false
	
func _on_saida_Gym_body_entered(body):
	get_tree().change_scene("res://scene3.tscn")
	Global.mercSaida = false
	Global.mercado=false
	Global.cenagym=false
	Global.gynsaida=true
	Global.teleporte=false
	Global.casa=false
	Global.casasaida=false
	Global.banco=false
	Global.bancosaida=false


func _on_Banco_body_entered(body):
	get_tree().change_scene("res://mercado.tscn")
	Global.mercSaida = false
	Global.mercado=false
	Global.cenagym=false
	Global.gynsaida=false
	Global.teleporte=false
	Global.casa=false
	Global.casasaida=false
	Global.banco=true
	Global.bancosaida=false

func _on_casa_body_entered(body):
	get_tree().change_scene("res://casa.tscn")
	Global.mercSaida = false
	Global.mercado=false
	Global.cenagym=false
	Global.gynsaida=false
	Global.teleporte=false
	Global.casa=true
	Global.casasaida=false
	Global.banco=false
	Global.bancosaida=false


func _on_banco_saida_body_entered(body):
	get_tree().change_scene("res://scene3.tscn")
	Global.mercSaida = false
	Global.mercado=false
	Global.cenagym=false
	Global.gynsaida=false
	Global.teleporte=false
	Global.casa=false
	Global.casasaida=false
	Global.banco=false
	Global.bancosaida=true


func _on_casasaida_body_entered(body):
	get_tree().change_scene("res://scene3.tscn")
	Global.mercSaida = false
	Global.mercado=false
	Global.cenagym=false
	Global.gynsaida=false
	Global.teleporte=false
	Global.casa=false
	Global.casasaida=true
	Global.banco=false
	Global.bancosaida=false
	
	
	
func _mensagem():
	if Global.minutos == 7:
		$M1.text = Global.remetente[0]
		$conteudoMensagem.text = Global.mensagem [0]
		
	
	
	
	
