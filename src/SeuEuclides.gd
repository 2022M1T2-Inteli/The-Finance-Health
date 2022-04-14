extends StaticBody2D

# var see = false
var dialog = ["Garoto... você tem que começar a pensar em guardar seu dinheiro sabe?",
"Porque você não abre uma Poupança, meu filho?",
"A poupança é uma aplicação de renda fixa simples e acessivel e pode ser aberta em qualquer banco de sua preferência!",
"Os regastes podem ser feitos a qualquer momento, e seu risco é extremamente baixo!"]
var temp = 0


func _ready():
#Esta função inicia o jogo com a visibilidade do sprite e do botão "next" desativadas
	$Area2D/FalaEuclides.visible = false
	$Next_Euclides.visible = false
	
#Esta função mostra o primeiro texto do diálogo quando o personagem entra em contato com a Area2D
##Esta função desativa a visibilidade do sprite e do botão ao sair da Area2D


#Esta função mostra o segundo texto do diálogo quando o usuario pressiona o botão "next"


func _on_Area2D_body_entered(body):
	$Next_Euclides.visible = true
	$Area2D/FalaEuclides.visible = true
	$Area2D/FalaEuclides/Label.percent_visible = 0
	$Area2D/FalaEuclides/Label.text = dialog[temp]
	$Tween.interpolate_property($Area2D/FalaEuclides/Label,"percent_visible",0,1,1.5,Tween.EASE_IN_OUT)
	$Tween.start()
	temp += 1
	
	
	#$AnimatedSpitecria.visible = false

func _on_Next_Euclides_pressed():

	$Area2D/FalaEuclides/Label.percent_visible = 0
	$Area2D/FalaEuclides/Label.text = dialog[temp]
	$Tween.interpolate_property($Area2D/FalaEuclides/Label,"percent_visible",0,1,1.5,Tween.EASE_IN_OUT)
	$Tween.start()
	temp +=1
	if Global.euclides == 0:
		Global.euclides += 1
		Global.conhecimento += 1 
	
	if temp == 4:
		$Next_Euclides.visible = false
		temp = 0
	else:
		pass


func _on_Area2D_body_exited(body):
	$Area2D/FalaEuclides.visible = false
	$Next_Euclides.visible = false
	$AnimatedSpritecria.visible = false
	temp = 0
