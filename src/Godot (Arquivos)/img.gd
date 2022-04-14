extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = String(Global.dinheiro)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_sair_pressed():
	get_tree().change_scene("res://celular.tscn")


func _on_investimento_pressed():
	get_tree().change_scene("res://escolher_invest.tscn")


func _on_extrato_ir_pressed():
	get_tree().change_scene("res://extrato.tscn")
