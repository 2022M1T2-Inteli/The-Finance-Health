extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MatematicaFinanceira_pressed():
	get_tree().change_scene("res://lerLivro.tscn")


func _on_gastos_pressed():
	get_tree().change_scene("res://Gastos.tscn")


func _on_inflacao_pressed():
	get_tree().change_scene("res://Inflacao.tscn")


func _on_investimentos_pressed():
	get_tree().change_scene("res://Tipos de Investimento.tscn")
