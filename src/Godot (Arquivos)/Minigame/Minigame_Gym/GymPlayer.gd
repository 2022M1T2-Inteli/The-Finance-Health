extends KinematicBody2D

const JUMP_H = 700
const GRAVITY = 40
var motion = Vector2()
var crouch_timer = 0

enum {RUN,JUMP,CROUCH}
var state = RUN

func _ready():
	if Global.vermelho:
		$Sprite.modulate = "ff0000"
	if Global.azul:
		$Sprite.modulate = "004aff"
	if Global.verde:
		$Sprite.modulate = "00ff05"
	if Global.amarelo:
		$Sprite.modulate = "ffff00"

func _physics_process(delta):
	motion.y += GRAVITY*(delta*60)
	if Global.game:
		match state:
			RUN:
				$UPbox.disabled = false
				$AnimationPlayer.play("Run_Right")
				if Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_accept"):
					motion.y -= JUMP_H
					state = JUMP
				elif Input.is_action_pressed("ui_down"):
					state = CROUCH
			JUMP:
				$AnimationPlayer.play("Roll_Right")
				if is_on_floor():
					state = RUN
			CROUCH:
				$AnimationPlayer.play("Roll_Right")
				crouch_timer += delta
				$UPbox.disabled = true
				if crouch_timer >= 0.5:
					crouch_timer = 0
					state = RUN
	
	else:
		$AnimationPlayer.play("Idle_Right")

	motion=move_and_slide(motion,Vector2.UP)


