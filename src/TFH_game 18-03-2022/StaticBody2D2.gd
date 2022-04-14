extends Area2D


var see = false
var dialog = ["Olá, sou o Dr.Gomes, CEO do banco TF",
"Aqui você poderá fazer aplicações financeiras e pegar emprestimos",
"Acesse também nosso aplicativo no seu celular"]

var tt = false
var temp = 1


func _ready():
#Esta função inicia o jogo com a visibilidade do sprite e do botão "next" desativadas
	$Sprite/.visible = false
	$next.visible = false
	

	


func _on_Area2D_body_entered(body):#
#Esta função mostra o primeiro texto do diálogo quando o personagem entra em contato com a Area2D
	$Sprite/Label.percent_visible = 0
	$Sprite/.visible = true
	$Sprite/Label.text = dialog[0]
	$Tween.interpolate_property($Sprite/Label,"percent_visible",0,1,1.5,Tween.EASE_IN_OUT)
	$Tween.start()
	$next.visible = true
		
	
func _on_Area2D_body_exited(body):
#Esta função desativa a visibilidade do sprite e do botão ao sair da Area2D
	$Sprite/.visible = false
	$next.visible = false 
	


func _on_next_pressed(): 
#Esta função mostra o segundo texto do diálogo quando o usuario pressiona o botão "next"
	$Sprite/Label.text = dialog[1]
	$Sprite/Label.percent_visible = 0
	$Sprite/.visible = true
	$Sprite/Label.text = dialog[1]
	$Tween.interpolate_property($Sprite/Label,"percent_visible",0,1,1.5,Tween.EASE_IN_OUT)
	$Tween.start()
	$next.visible = false
	
