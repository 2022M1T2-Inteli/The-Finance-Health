extends CanvasModulate


func _process(delta):
	var CurrentFrame = range_lerp(Global.minutos,0,24,0,24)
	$AnimationPlayer.play("DayNightCycle")
	$AnimationPlayer.seek(CurrentFrame)
