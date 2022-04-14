extends Sprite

var textos = ["Matemática Financeira" , 
"É um dos passos mais importantes para ter noção do impacto do tempo no valor do dinheiro." ,
"Exemplo: Caso você gaste 20 tendo o patrimônio de 1000, você gastou 2% do seu patrimônio. Caso o gasto seja de 2 ao invés de 20, este gasto se equivale a 0,2% do seu patrimônio, porém, caso o seu patrimônio aumente para 1500, o gasto de 2 moedas passa a ser equivalente em 0,13%",
"O conceito de Matemática Financeira, pode também ser divido em três importantes definições, que moldam o mercado e nossa vida financeira. Sendo eles: Capital, Juros e Montante",
"Capital (C): Representa o valor do dinheiro no momento atual. Este valor pode ser de um investimento, dívida ou empréstimo.", "Juros (J): Os juros representam, por exemplo, o custo do dinheiro tomado emprestado, ele pode também ser obtido pelo retorno de uma aplicação ou ainda pela diferença entre o valor à vista e a prazo em uma transação comercial", 
"Montante (M): Corresponde ao valor futuro, ou seja, é o capital mais os juros acrescidos ao valor." ]

var prox_pagina = 0


func _ready():
	$pagina1.text = textos[prox_pagina]
	$VoltarBiblioteca.visible = false

func _process(delta):
	if prox_pagina >= 6:
		$VoltarBiblioteca.visible = true
		$Button.visible = false
		$Button2.visible = true
	elif prox_pagina < 6 and prox_pagina > 0:
		$VoltarBiblioteca.visible = false
		$Button.visible = true
		$Button2.visible = true
	elif prox_pagina <= 0:
		$VoltarBiblioteca.visible = false
		$Button.visible = true
		$Button2.visible = false

func _on_Button_pressed():
	prox_pagina +=1
	$pagina1.text = textos[prox_pagina]
		
func _on_Button2_pressed():
	prox_pagina -=1
	$pagina1.text = textos[prox_pagina]

func _on_VoltarBiblioteca_pressed():
	get_tree().change_scene("res://Biblioteca.tscn")
