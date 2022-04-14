extends StaticBody2D

var dialog = ["Bom dia, Steve! Acabei de sair da Academia, estou cansado demais....", 
"E Você já planejou o seu dia? É muito importante que você tenha um planejamento de curto a longo prazo.",
"Implementar e completar tarefas com disciplina, como eu... Principalmente disciplina financeira!"]

var temp = 0




func _ready():
	$AreaJeff/FalaDoJeff/Label.visible = true
	$Next_Jeff.visible = false
	
	
	
	
	
	


func _on_AreaJeff_body_entered(body):
	$Next_Jeff.visible = true
	$AreaJeff/FalaDoJeff.visible = true
	$AreaJeff/FalaDoJeff/Label.percent_visible = 0
	$AreaJeff/FalaDoJeff/Label.text = dialog[temp]
	$Tween.interpolate_property($AreaJeff/FalaDoJeff/Label,"percent_visible",0,1,1.5,Tween.EASE_IN_OUT)
	$Tween.start()
	temp +=1
	if Global.jeff == 0:
		Global.jeff += 1
		Global.conhecimento +=1
	
func _on_Next_Jeff_pressed():
	
	$AreaJeff/FalaDoJeff/Label.percent_visible = 0
	$AreaJeff/FalaDoJeff/Label.text = dialog[temp]
	$Tween.interpolate_property($AreaJeff/FalaDoJeff/Label,"percent_visible",0,1,1.5,Tween.EASE_IN_OUT)
	$Tween.start()
	temp +=1
	
	if temp == 3:
		$Next_Jeff.visible = false
		temp = 0
	else:
		pass


func _on_AreaJeff_body_exited(body):
	$AreaJeff/FalaDoJeff.visible = false
	$Next_Jeff.visible = false
	temp = 0
