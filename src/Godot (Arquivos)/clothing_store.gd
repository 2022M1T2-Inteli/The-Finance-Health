extends Node2D

var preco_vermelho = 50 * Global.inflacao
var preco_azul = 40 * Global.inflacao
var preco_verde = 30 * Global.inflacao
var preco_amarelo = 20 * Global.inflacao

func _ready():
	$PaintSeller/PaintRed/Price.visible = false
	$PaintSeller/PaintRed/GoRed.visible = false
	$PaintSeller2/PaintBlue/Price.visible = false
	$PaintSeller2/PaintBlue/GoBlue.visible = false
	$PaintSeller3/PaintGreen/Price.visible = false
	$PaintSeller3/PaintGreen/GoGreen.visible = false
	$PaintSeller4/PaintYellow/Price.visible = false
	$PaintSeller4/PaintYellow/GoYellow.visible = false

func _process(delta):
	$Player/CanvasLayer/h.text = str(str(Global.horas)+"h"+str(Global.minutos))
	$Player/CanvasLayer/dia.text = str("Dia "+str(Global.dias))
	$PaintSeller/PaintRed/Price.text = str(round(preco_vermelho))
	$PaintSeller2/PaintBlue/Price.text = str(round(preco_azul))
	$PaintSeller3/PaintGreen/Price.text = str(round(preco_verde))
	$PaintSeller4/PaintYellow/Price.text = str(round(preco_amarelo))

func _on_PaintRed_body_entered(body):
	if body.name == "Player":
		$PaintSeller/PaintRed/Price.visible = true
		$PaintSeller/PaintRed/GoRed.visible = true
func _on_PaintRed_body_exited(body):
	if body.name == "Player":
		$PaintSeller/PaintRed/Price.visible = false
		$PaintSeller/PaintRed/GoRed.visible = false
func _on_GoRed_pressed():
	Global.dinheiro -= preco_vermelho
	Global.extrato.append(Global.zero - (preco_vermelho * Global.inflacao))
	Global.vermelho = true
	Global.azul = false
	Global.verde = false
	Global.amarelo = false

func _on_PaintBlue_body_entered(body):
	if body.name == "Player":
		$PaintSeller2/PaintBlue/Price.visible = true
		$PaintSeller2/PaintBlue/GoBlue.visible = true
func _on_PaintBlue_body_exited(body):
	if body.name == "Player":
		$PaintSeller2/PaintBlue/Price.visible = false
		$PaintSeller2/PaintBlue/GoBlue.visible = false
func _on_GoBlue_pressed():
	Global.dinheiro -= preco_azul
	Global.extrato.append(Global.zero - (preco_azul * Global.inflacao))
	Global.vermelho = false
	Global.azul = true
	Global.verde = false
	Global.amarelo = false

func _on_PaintGreen_body_entered(body):
	if body.name == "Player":
		$PaintSeller3/PaintGreen/Price.visible = true
		$PaintSeller3/PaintGreen/GoGreen.visible = true
func _on_PaintGreen_body_exited(body):
	if body.name == "Player":
		$PaintSeller3/PaintGreen/Price.visible = false
		$PaintSeller3/PaintGreen/GoGreen.visible = false
func _on_GoGreen_pressed():
	Global.dinheiro -= preco_verde
	Global.extrato.append(Global.zero - (preco_verde * Global.inflacao))
	Global.vermelho = false
	Global.azul = false
	Global.verde = true
	Global.amarelo = false


func _on_PaintYellow_body_entered(body):
	if body.name == "Player":
		$PaintSeller4/PaintYellow/Price.visible = true
		$PaintSeller4/PaintYellow/GoYellow.visible = true
func _on_PaintYellow_body_exited(body):
	if body.name == "Player":
		$PaintSeller4/PaintYellow/Price.visible = false
		$PaintSeller4/PaintYellow/GoYellow.visible = false
func _on_GoYellow_pressed():
	Global.dinheiro -= preco_amarelo
	Global.extrato.append(Global.zero - (preco_amarelo * Global.inflacao))
	Global.vermelho = false
	Global.azul = false
	Global.verde = false
	Global.amarelo = true
