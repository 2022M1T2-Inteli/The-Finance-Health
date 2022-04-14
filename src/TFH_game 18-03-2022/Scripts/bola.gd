extends KinematicBody2D

export var rapidez = 500

var mundo = "res://mundo.tscn"
var direcao = Vector2(0.5,1)
var correndo = false

onready var bola_visibility_notifier = get_node("bolaVisibilityNotifier")

func _process(delta):
	rapidez = 500 + Global.tijolos*2
	
func _physics_process(delta):
	
	if Input. is_action_just_pressed("fire"):
		correndo = true
	elif not correndo:
		return
		
	check_if_game_over()
	
	var velocidade = rapidez * direcao * delta
	var colisao = move_and_collide(velocidade)
	
	if colisao != null:
			direcao = direcao.bounce(colisao.normal)
			if (colisao.collider.name == "tijolosSolid"):
				colisao.collider.hit()

	
func check_if_game_over():
	if not bola_visibility_notifier.is_on_screen():
		self.position = Vector2(552,272)
		correndo = false
		
