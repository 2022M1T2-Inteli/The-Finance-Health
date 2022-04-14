extends StaticBody2D

var temp = 0
var dialog = ["Olá! Você trabalha num banco e ainda não sabe sobre investimentos??", 
"Ok.. tudo bem. Vamos lá! O primeiro tipo de investimento que você precisa saber é o de Renda Fixa!",
"Renda Fixa são títulos de risco baixo que geram um retorno pré-combinado com pagamentos mensais, tendo sempre uma data de vencimento"]

func _ready():
	$arinha_doRafael/FalaDoRafael.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_arinha_doRafael_body_entered(body):
	print("passei")
	$arinha_doRafael/FalaDoRafael/next_Rfael.visible = true
	$arinha_doRafael/FalaDoRafael.visible = true
	$arinha_doRafael/FalaDoRafael/Label.percent_visible = 0
	$arinha_doRafael/FalaDoRafael/Label.text = dialog[temp]
	$Tween.interpolate_property($arinha_doRafael/FalaDoRafael/Label,"percent_visible",0,1,1.5,Tween.EASE_IN_OUT)
	$Tween.start()
	temp += 1
	$Exclamation_Rafael.visible = false


func _on_next_Rfael_pressed():
	$arinha_doRafael/FalaDoRafael/Label.percent_visible = 0
	$arinha_doRafael/FalaDoRafael/Label.text = dialog[temp]
	$Tween.interpolate_property($arinha_doRafael/FalaDoRafael/Label,"percent_visible",0,1,1.5,Tween.EASE_IN_OUT)
	$Tween.start()
	temp +=1
	if Global.rafael == 0:
		Global.rafael += 1
		Global.conhecimento += 1 
	
	if temp == 3:
		$arinha_doRafael/FalaDoRafael/next_Rfael.visible = false
		temp = 0
	else:
		pass



func _on_arinha_doRafael_body_exited(body):
	$arinha_doRafael/FalaDoRafael.visible = false
	temp = 0
