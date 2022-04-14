extends Node2D

var textos = ["Matemática Financeira" , 
"É uma dos passos mais importantes para ter noção do impacto do tempo no valor do dinheiro." ,
"Exemplo: Caso você gaste 20 tendo o patrimônio de 1000, você gastou 2% do seu patrimônio. Caso o gasto seja de 2 moedas ao invés de 20, este gasto se equivale a 0,2% do seu patrimônio, porém, caso o seu patrimônio aumente para 1500, o gasto de 2 moedas passa a ser equivalente em 0,13%",
"Capital (C): Representa o valor do dinheiro no momento atual. Este valor pode ser de um investimento, dívida ou empréstimo.", "Juros (J): Os juros representam, por exemplo, o custo do dinheiro tomado emprestado, ele pode também ser obtido pelo retorno de uma aplicação ou ainda pela diferença entre o valor à vista e a prazo em uma transação comercial", 
"Montante (M): Corresponde ao valor futuro, ou seja, é o capital mais os juros acrescidos ao valor." ]

var prox_pagina = 0


func _ready():
	$CanvasLayer/livro/pagina1.text = textos[0]
	


func _on_Button_pressed():
	prox_pagina +=1
	$CanvasLayer/livro/pagina1.text = textos[prox_pagina]
	if prox_pagina >= 6:
		prox_pagina = 0
	
