extends Sprite


var texto = ["Inflação e Planejamento Financeiro", 
"A inflação é responsável pela valorização dos produtos e bens de consumo que compramos no nosso dia a dia. Uma inflação de 10% ao ano, significa que em média, os produtos que consumimos no dia a dia subiram 10% de preço no ano. Ou seja, o produto que encontrávamos para comprar por 10 moedas, agora custam 11 moedas.",
"Por isso, devemos nos planejar financeiramente e ter disciplina em nossos objetivos. É importante, também, compreender, que não investir o seu dinheiro também é um risco, pois ao longo do tempo, o valor do dinheiro tende a diminuir. Quanto mais o tempo passa e mais a inflação sobe, menos uma nota de 100 consegue comprar."]

var prox_paginaI = 0

func _ready():
	$Pagina1.text = texto [prox_paginaI]
	$VoltarBiblioteca.visible = false
	$VoltarPagina.visible = false
	

func _process(delta):
	if prox_paginaI > 2:
		$VoltarBiblioteca.visible = true
		$pagina1TI.visible = true
		$ProximaPagina.visible = false
		
	elif prox_paginaI < 2 and prox_paginaI > 0:
		$VoltarBiblioteca.visible = false
		$ProximaPagina.visible = true
		$VoltarPagina.visible = true
		
	elif prox_paginaI <= 0:
		$VoltarBiblioteca.visible = false
		$ProximaPagina.visible = true
		$VoltarPagina.visible = false


func _on_ProximaPagina_pressed():
	prox_paginaI +=1
	$Pagina1.text = texto [prox_paginaI]

	if prox_paginaI >= 2:
		$VoltarBiblioteca.visible = true
		$VoltarPagina.visible = true
		$ProximaPagina.visible = false

func _on_VoltarPagina_pressed():
	prox_paginaI -=1
	$Pagina1.text = texto [prox_paginaI]
	
func _on_VoltarBiblioteca_pressed():
	get_tree().change_scene("res://Biblioteca.tscn")
