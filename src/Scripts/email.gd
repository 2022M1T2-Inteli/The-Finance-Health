extends Node2D

func _ready():
	$Button2/amelia.visible = false
	$Button2/rafael.visible = false
	$Button2/drGomes.visible = false
	$Button2/guilherme.visible = false
	$Button2/jeff.visible = false

func _process(delta):
	$Button2/Label.text = Global.remetente1
	if Global.remetente1 == "Dr.Gomes":
		$Button2/drGomes.visible = true
		$Button2/amelia.visible = false
		$Button2/rafael.visible = false
		$Button2/guilherme.visible = false
		$Button2/jeff.visible = false
	if Global.remetente1 == "Amélia":
		$Button2/amelia.visible = true
		$Button2/rafael.visible = false
		$Button2/drGomes.visible = false
		$Button2/guilherme.visible = false
		$Button2/jeff.visible = false
	if Global.remetente1 == "Guilherme":
		$Button2/guilherme.visible = true
		$Button2/amelia.visible = false
		$Button2/rafael.visible = false
		$Button2/drGomes.visible = false
		$Button2/jeff.visible = false
	if Global.remetente1 == "Rafael":
		$Button2/rafael.visible = true
		$Button2/amelia.visible = false
		$Button2/drGomes.visible = false
		$Button2/guilherme.visible = false
		$Button2/jeff.visible = false
	if Global.remetente1 == "Jeff":
		$Button2/jeff.visible = true
		$Button2/drGomes.visible = false
		$Button2/amelia.visible = false
		$Button2/rafael.visible = false
		$Button2/guilherme.visible = false

func _on_Button_pressed():
	get_tree().change_scene("res://celular.tscn")


func _on_Button2_pressed():
	get_tree().change_scene("res://msg_email.tscn")
