extends KinematicBody2D

export var aceleracao = 800 

var velocidade = Vector2.ZERO
var atrito = 200


	
func _physics_process(delta):
	if Input. is_action_just_pressed("fire"):
		Global.comecoutrabalho = true
	if Global.comecoutrabalho == true:	
		if Input. is_action_pressed("mover_esquerda"):
			velocidade.x = -aceleracao 
		if Input. is_action_pressed("mover_direita"):
			velocidade.x = aceleracao
	
	move_and_slide(velocidade)
	
	velocidade = velocidade.move_toward(Vector2.ZERO,atrito)
