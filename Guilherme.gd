extends StaticBody2D


var dialog = ["Olá, Steve. Obrigado por abrir sua Conta Salário conosco.", 
"Como sua rentabilidade ainda não é muito alta, vou te dar sempre algumas dicas de como aumentar sua renda.", 
"No trabalho você poderá acessar as suas responsabilidades diárias, e aprender com pessoas de cargo mais alto e com maior experiência."]

var temp = 0

func _ready():
	$areaGuilherme/FalaDoGuilherme.visible = false



func _on_areaGuilherme_body_entered(body):
	$areaGuilherme/FalaDoGuilherme/Next_Guilherme.visible = true
	$areaGuilherme/FalaDoGuilherme.visible = true
	$areaGuilherme/FalaDoGuilherme/Label.percent_visible = 0
	$areaGuilherme/FalaDoGuilherme/Label.text = dialog[temp]
	$Tween.interpolate_property($areaGuilherme/FalaDoGuilherme/Label,"percent_visible",0,1,1.5,Tween.EASE_IN_OUT)
	$Tween.start()
	temp += 1
	
	$Exclamation_Guilherme.visible = false

func _on_Next_Guilherme_pressed():
	$areaGuilherme/FalaDoGuilherme/Label.percent_visible = 0
	$areaGuilherme/FalaDoGuilherme/Label.text = dialog[temp]
	$Tween.interpolate_property($areaGuilherme/FalaDoGuilherme/Label,"percent_visible",0,1,1.5,Tween.EASE_IN_OUT)
	$Tween.start()
	temp +=1
	if Global.guilherme == 0:
		Global.guilherme += 1
		Global.conhecimento +=1
	
	if temp == 3:
		$areaGuilherme/FalaDoGuilherme/Next_Guilherme.visible = false
		temp = 0
	else:
		pass



func _on_areaGuilherme_body_exited(body):
	$areaGuilherme/FalaDoGuilherme.visible = false
	temp = 0
