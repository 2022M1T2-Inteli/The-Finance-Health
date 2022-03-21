extends Area2D

var txt1 = false
var dialog = ["Olá, sou a Amélia, atendente do mercado",
"Eu vejo a sua cara de descontentamento... a culpa não é minha. Os preços aumentaram de novo!", "A inflação aumentou!.",
"Você sabe o que é a inflação? A Inflação é o aumento persistente e generalizado no valor dos preços, ou seja se a inflação é de 10% os preços dos produtos aumentaram em 10% (ex: $ 10 para $ 11)"
 ]
# Called when the node enters the scene tree for the first time.
func _ready():
	$fala.visible = false


# Called ever



func _on_Amlia__body_entered(body):
	$fala/Label.percent_visible = 0
	$fala.visible = true
	$fala/Label.text = dialog[0]
	$Tween.interpolate_property($fala/Label,"percent_visible",0,1,1.5,Tween.EASE_IN_OUT)
	$Tween.start()



func _on_next_amelia_pressed():
	$fala/Label.get_font("font").size = 33
	$fala/Label.percent_visible = 0
	$fala.visible = true
	$fala/Label.text = dialog[1]
	$Tween.interpolate_property($fala/Label,"percent_visible",0,1,1.5,Tween.EASE_IN_OUT)
	$Tween.start()
	$fala/next_amelia.visible = false
	

	


func _on_Amlia__body_exited(body):
	$fala.visible = false
