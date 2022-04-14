extends Area2D


var see = false
var dialog = ["Olá, sou o Dr.Gomes, CEO do GTB Bank",
"Aqui você poderá realizar aplicações financeiras, pegar emprestimos, tirar dúvidas com seus colegas",
"Para sua comodidade você pode acessar algumas funções do Banco, em nosso aplicativo no seu celular!"]

var tt = false
var temp = 0


func _ready():
#Esta função inicia o jogo com a visibilidade do sprite e do botão "next" desativadas
	$Sprite/.visible = false
	$next.visible = false
	

	


func _on_Area2D_body_entered(body):#
#Esta função mostra o primeiro texto do diálogo quando o personagem entra em contato com a Area2D
	$Sprite/Label.percent_visible = 0
	$Sprite/.visible = true
	$Sprite/Label.text = dialog[temp]
	$Tween.interpolate_property($Sprite/Label,"percent_visible",0,1,1.5,Tween.EASE_IN_OUT)
	$Tween.start()
	$next.visible = true
	temp += 1
	
	$Exclamation_DrGomes.visible = false
	
func _on_Area2D_body_exited(body):
#Esta função desativa a visibilidade do sprite e do botão ao sair da Area2D
	$Sprite/.visible = false
	$next.visible = false 
	temp = 0 
	


func _on_next_pressed(): 
#Esta função mostra o segundo texto do diálogo quando o usuario pressiona o botão "next"
	$Sprite/Label.text = dialog[temp]
	$Sprite/Label.percent_visible = 0
	$Sprite/.visible = true
	$Tween.interpolate_property($Sprite/Label,"percent_visible",0,1,1.5,Tween.EASE_IN_OUT)
	$Tween.start()
	temp += 1
	
	if temp >= 3:
		$next.visible = false
		temp = 0
		
	if Global.dinheiro < 100:
		Global.dinheiro +=100
		
	if Global.gomes == 0:
		Global.gomes += 1
		Global.conhecimento +=1
		
	
	
