extends Node2D

var button = 0

func _ready():
	$music_gym.play()
	$layer2/esteira/PlayGym/StartGym.visible = false
	$layer2/esteira2/PlayGym2/StartGym2.visible = false
	$Player/CanvasLayer/Tutorial.visible = false
	$layer2/esteira/PlayGym/Price.visible = false
	$layer2/esteira2/PlayGym2/Price.visible = false
	
	
func _process(delta):
	$Player/CanvasLayer/h.text = str(str(Global.horas)+"h"+str(Global.minutos))
	$Player/CanvasLayer/dia.text = str("Dia "+str(Global.dias))
	$layer2/esteira/PlayGym/Price.text = str(round(Global.ValorAcademia * Global.inflacao))
	$layer2/esteira2/PlayGym2/Price.text = str(round(Global.ValorAcademia * Global.inflacao))
	$layer2/sacoporrada1/AnimationPlayer.play("saco de porrada")
	$layer2/sacoporrada2/AnimationPlayer.play("sacop de porrada 2")
	$layer2/esteira2/AnimationPlayer.play("esteira")
	$layer2/esteira/AnimationPlayer.play("esteira")
	
	
func _on_PlayGym_body_entered(body):
	if body.name == "Player":
		$layer2/esteira/PlayGym/StartGym.visible = true
		$layer2/esteira/PlayGym/Price.visible = true
func _on_PlayGym_body_exited(body):
	$layer2/esteira/PlayGym/StartGym.visible = false
	$Player/CanvasLayer/Tutorial.visible = false
	$layer2/esteira/PlayGym/Price.visible = false

func _on_PlayGym2_body_entered(body):
	if body.name == "Player":
		$layer2/esteira2/PlayGym2/StartGym2.visible = true
		$layer2/esteira2/PlayGym2/Price.visible = true
func _on_PlayGym2_body_exited(body):
	$layer2/esteira2/PlayGym2/StartGym2.visible = false
	$Player/CanvasLayer/Tutorial.visible = false
	$layer2/esteira2/PlayGym2/Price.visible = false

func _on_StartGym_pressed():
	$Player/CanvasLayer/Tutorial.visible = true
func _on_PlayGym_pressed():
	button += 1
	if button == 1:
		Global.dinheiro -= Global.ValorAcademia * Global.inflacao
		Global.extrato.append(Global.zero - (Global.ValorAcademia * Global.inflacao))
		get_tree().change_scene("res://Minigame/Minigame_Gym/GymGame.tscn")
