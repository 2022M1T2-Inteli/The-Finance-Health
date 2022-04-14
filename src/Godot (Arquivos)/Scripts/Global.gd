extends Node

var fruits_count = 1
var gym_count = 1
var ValorAcademia = 15
var lastPosition = 0
var dinheiro = 1000
var lifeb = 0
var teleporte = false
var minigameMARKETsaida = false
var horas = 6
var minutos = 0
var dias = 1
var segundos = 0
var ptMercado = 0
var investido = 0
var investir = 0
var minigameGYMsaida = false
var casaTRIVIAsaida = false
var remetente = ["Dr.Gomes","Amélia","Guilherme", "Rafael", "Jeff"]
var remetente1 = str("Ninguém por enquanto")
var conteudo = str("Nada por enquanto")
var mensagem = [
	"Bom dia!, estamos muito ansiosos para te conhecer e para ter você no nosso time! Venha ao GTB Bank! Caso esteja perdido, venha diretamente pelo icone de mapa no seu celular, mas haverá um custo...",
	"Bom dia! Venha conhecer o mercado! Local onde você poderá comprar produtos para aumentar sua saúde e felicidade! Aqui também, te darei algumas dicas sobre Educação Financeira, e como ela podem implicar em situações e locais reais, como o mercado.",
	"Bom dia, Steve! Hoje vou te passar algumas orientações no seu primeiro dia de trabalho. Me encontre na minha Sala ao chegar, por favor."
]
var mensagem_evento = [
	"Você pagou para te pintarem??? Você está todo sujo, vá logo tomar um banho na sua casa para se limpar",
	"Vejo que você aprendeu bastante sobre finanças conversando com outras pessoas. Parabéns! Que tal acessar a biblioteca na sua casa para rever o que aprendeu?",
	"Você está ficando muito triste! Tome cuidado com isso, sua saúde será prejudicada. Vá para academia se divertir um pouco!",
	"Sua saúde está muito baixa! Vá comprar comida no mercado para aumentá-la. Se ficar doente, você irá ao hospital e vão tirar metade do seu dinheiro!"
]
var contagem = 0
var contagem1 = 0
var contagemFelicidade = 0
var contagemSaude = 0
var ultimaCena 
var ultimapos
var teste = false
var extrato = []
var recebeu_mensagem = false
var BarraSaude = 100
var MenosSaude = 0.005
var BarraFelicidade = 100
var MenosFelicidade = 0.005
var game = false
var end_game = false
var gym_points = 0
var gym_record_points = 0
var cdb = 0
var conhecimento = 0
var euclides = 0
var jeff = 0
var gomes = 0
var guilherme = 0
var rafael = 0
var amelia = 0
var inflacao = 1
var vermelho = false
var azul = false
var verde = false
var amarelo = false
var zero = 0
var mudarcena = false
var cena 
var market_instrunction
var morreu = false
var comecoutrabalho = false
var tijolos = 0
var dinheirojogo = 0
