extends Node2D

var ValorMuseu = 10 * Global.inflacao
var pago = false

func _ready():
	$livros/Livro1/Livro1.visible = false
	$livros/Livro2/Livro2.visible = false
	$livros/Livro3/Livro3.visible = false
	$animated123/AnimatedSprite2/StaticBody2D/Cobranca/Button.visible = false
	$animated123/AnimatedSprite2/StaticBody2D/Cobranca/Price.visible = false
	$animated123/AnimatedSprite2/StaticBody2D/Cobranca/Price.text = str(ValorMuseu)
	
	
	
	
func _process(delta):
	$Player/CanvasLayer/dia.text = str("Dia "+str(Global.dias))
	$Player/CanvasLayer/h.text = str(str(Global.horas) +"h"+ str(Global.minutos))


func _on_Livro1_body_entered(body):
	if body.name == "Player":
		$livros/Livro1/Livro1.visible = true

func _on_Livro1_body_exited(body):
	if body.name == "Player":
		$livros/Livro1/Livro1.visible = false


func _on_Livro2_body_entered(body):
	if body.name == "Player":
		$livros/Livro2/Livro2.visible = true

func _on_Livro2_body_exited(body):
	if body.name == "Player":
		$livros/Livro2/Livro2.visible = false


func _on_Livro3_body_entered(body):
	if body.name == "Player":
		$livros/Livro3/Livro3.visible = true

func _on_Livro3_body_exited(body):
	$livros/Livro3/Livro3.visible = false


func _on_Cobranca_body_entered(body):
	if body.name == "Player":
		if !pago:
			$animated123/AnimatedSprite2/StaticBody2D/Cobranca/Button.visible = true
			$animated123/AnimatedSprite2/StaticBody2D/Cobranca/Price.visible = true

func _on_Cobranca_body_exited(body):
	$animated123/AnimatedSprite2/StaticBody2D/Cobranca/Button.visible = false
	$animated123/AnimatedSprite2/StaticBody2D/Cobranca/Price.visible = false


func _on_Button_pressed():
	if !pago:
		Global.dinheiro -= ValorMuseu
		$Entrada.queue_free()
		pago = true
