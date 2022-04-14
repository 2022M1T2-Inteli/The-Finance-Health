extends Sprite


var texto = ["Gastos necessesários (querer vs necessidade)", 
"Os gastos essenciais são explicados através das necessidades mais básicas, levando à diferença entre querer comprar algo e precisar comprar algo", 
"É muito comum percebermos que duas ou mais coisas essenciais para nosso dia a dia podem ser obtidas de diversas maneiras diferentes, como por exemplo andar de taxi ou de metrô, tem como objetivo a locomoção até o destino, porém, o taxi oferece alguns confortos, mas o metrô acaba saindo mais barato.",
"Isso pode ser divido também na composição dos seus gatos em relação ao planejamento financeiro.",
"Em Necessidades: Normalmente é sugerido que utilizemos 50% da nossa renda com gastos essenciais.Já nos, desejos pessoais: Todos os gastos com bens de consumo e serviços que não forem essenciais devem estar incluídos nessa categoria. Além disso, o valor máximo deve corresponder a 30% da renda",
"Como última opção podemos citar poupar, pagar dívidas, e investir: Com 80% dos seus ganhos comprometidos nas categorias anteriores, é preciso separar uma parte da sua renda para quitar dívidas, montar uma reserva financeira e diversificar a carteira de investimentos. Essa parte representa suas economias e metas financeiras, sendo assim, deve compor pelo menos 20% da renda."]

var prox_paginaG = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$pagina1.text = texto [prox_paginaG]
	$ProximaPagina.visible = true
	$VoltarPagina.visible = false
	$VoltarBiblioteca.visible = false
	
func _process(delta):
	if prox_paginaG > 5:
		$VoltarBiblioteca.visible = true
		$pagina1TI.visible = true
		$ProximaPagina.visible = false
		
	elif prox_paginaG < 5 and prox_paginaG > 0:
		$VoltarBiblioteca.visible = false
		$ProximaPagina.visible = true
		$VoltarPagina.visible = true
		
	elif prox_paginaG <= 0:
		$VoltarBiblioteca.visible = false
		$ProximaPagina.visible = true
		$VoltarPagina.visible = false

func _on_ProximaPagina_pressed():
	prox_paginaG +=1
	$pagina1.text = texto [prox_paginaG]
	$VoltarPagina.visible = true
	
	if prox_paginaG >= 5:
		$VoltarBiblioteca.visible = true
		$VoltarPagina.visible = true
		$ProximaPagina.visible = false

func _on_VoltarPagina_pressed():
	prox_paginaG -=1
	$pagina1.text = texto [prox_paginaG]
	$VoltarPagina.visible = true
	$ProximaPagina.visible = true
	$VoltarBiblioteca.visible = false

func _on_VoltarBiblioteca_pressed():
	get_tree().change_scene("res://Biblioteca.tscn")
