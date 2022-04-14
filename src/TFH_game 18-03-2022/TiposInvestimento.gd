extends Sprite


var texto = ["Tipos de Investimento",
"Renda Fixa: Títulos que geram um retorno pré-combinado com pagamentos mensais, tendo sempre uma data de vencimento. É dividido em três categorias: Público (Nota do Tesouro Nacional - NTN), Privado (Certificado de Depósito Bancário -CDB) e Incentivado ou Certificado de Recebíveis (Isento de imposto)",
"Os Títulos Públicos propõem liquidez diária, ou seja, é possível vender seus títulos mesmo antes do vencimento pré-combinado. Neste título possui 20% de imposto sobre seus rendimentos", 
"Os Títulos Privados não possuem liquidez diária, sendo necessário carregar o título até a data de vencimento. Este título possui 20% de imposto sobre seus rendimentos",
"Por fim, os títulos Incentivados não possuem liquidez diária, sendo necessário carregar o título até a data de vencimento. Este título possui isenção de imposto sobre seus rendimentos.",

"Já a Renda Variável se refere as Ações.", 
"Por definição se delimita a deter uma fração do patrimônio de empresas, correndo os seus riscos e recebendo seus retornos através de dividendos. A comercialização de Ações é realizada com base diária, tendo uma alta liquidez, porém alta volatilidade e incerteza no seu retorno."]

var prox_paginaTI = 0

func _ready():
	$pagina1TI.text = texto[prox_paginaTI]
	$VoltarBiblioteca.visible = false
	$VoltarPagina.visible = false

func _process(delta):
	if prox_paginaTI > 5:
		$VoltarBiblioteca.visible = true
		$pagina1TI.visible = true
		$ProximaPagina.visible = false
		
	elif prox_paginaTI < 5 and prox_paginaTI > 0:
		$VoltarBiblioteca.visible = false
		$ProximaPagina.visible = true
		$VoltarPagina.visible = true
		
	elif prox_paginaTI <= 0:
		$VoltarBiblioteca.visible = false
		$ProximaPagina.visible = true
		$VoltarPagina.visible = false
		
func _on_ProximaPagina_pressed():
	prox_paginaTI +=1
	$pagina1TI.text = texto[prox_paginaTI]


func _on_VoltarPagina_pressed():
	prox_paginaTI -=1
	$pagina1TI.text = texto[prox_paginaTI]
	
func _on_VoltarBiblioteca_pressed():
	get_tree().change_scene("res://Biblioteca.tscn")
