extends Node2D


func _ready(): #aqui estamos iniciando as animações nas lampadas dos postes
	$TileMap/light/Sprite/AnimationPlayer.play("lamp")
	$TileMap/light/Sprite2/AnimationPlayer.play("lamp")
	$TileMap/light/Sprite3/AnimationPlayer.play("lamp")
	$TileMap/light/Sprite4/AnimationPlayer.play("lamp")
	$TileMap/light/Sprite5/AnimationPlayer.play("lamp")
	$TileMap/light/Sprite6/AnimationPlayer.play("lamp")
	$TileMap/light/Sprite7/AnimationPlayer.play("lamp")
	$TileMap/light/Sprite8/AnimationPlayer.play("lamp")
	$TileMap/light/Sprite9/AnimationPlayer.play("lamp")
	$TileMap/light/Sprite10/AnimationPlayer.play("lamp")
	
	$Player/CanvasLayer/MenuButton/PopEntrada.visible = false

func _process(delta):
	
	if Global.horas >= 21: #aqui estamos desabilitando as entradas dos estabelecimentos(exeto a casa do player) ás 21h 
		$Area2D/CollisionShape2D.disabled = true
		$mercado/CollisionShape2D.disabled = true
		$Banco/CollisionShape2D.disabled = true
	elif Global.horas >= 5:
		$Area2D/CollisionShape2D.disabled = false #aqui estamos reabilitando as entradas dos estabelecimentos ás 5h
		$mercado/CollisionShape2D.disabled = false
		$Banco/CollisionShape2D.disabled = false
	
	#aqui estamos iniciando todas as animações dentro da nossa cena 3
	$overlay/lixo2/AnimationPlayer.play("lixo")
	$overlay/lixo4/AnimationPlayer.play("lixo")
	$overlay/sapo/AnimationPlayer.play("sapo")
	$overlay/sapo2/AnimationPlayer.play("sapo")
	$overlay/sapo3/AnimationPlayer.play("sapo")
	$overlay/sapo4/AnimationPlayer.play("sapo")
	$overlay/sapo5/AnimationPlayer.play("sapo")
	$overlay/pomba/AnimationPlayer.play("pomba")
	$overlay/pomba2/AnimationPlayer.play("pomba")
	$overlay/pomba3/AnimationPlayer.play("pomba")
	$overlay/pomba4/AnimationPlayer.play("pomba")
	$overlay/pomba5/AnimationPlayer.play("pomba")
	$overlay/pomba6/AnimationPlayer.play("pomba")
	$overlay/pomba7/AnimationPlayer.play("pomba")
	$overlay/pomba8/AnimationPlayer.play("pomba")
	$overlay/pomba9/AnimationPlayer.play("pomba")
	$overlay/pomba10/AnimationPlayer.play("pomba")
	$overlay/bebedouro/AnimationPlayer.play("bebedouro")
	$overlay/bebedouro2/AnimationPlayer.play("bebedouro")
	$overlay/condodoor/AnimationPlayer.play("condo door")
	$TileMap/fountain/AnimationPlayer.play("fountain")	
	
	
	
	
	$Player/CanvasLayer/dia.text = str("Dia "+str(Global.dias))
	$Player/CanvasLayer/h.text = str(str(Global.horas) +"h"+ str(Global.minutos))
	
	if Global.horas >= 18: #esta função acende as luzes dos postes quando for 18h
#		var i=2;
#		while i<=10:
#			var luz = preload("$TileMap/light/Sprite"+str(i)+"/Light2D")
#			print(luz)
#			luz.visible = true
#			i+=1
		$TileMap/light/Sprite/Light2D.visible = true
		$TileMap/light/Sprite2/Light2D.visible = true
		$TileMap/light/Sprite3/Light2D.visible = true
		$TileMap/light/Sprite4/Light2D.visible = true
		$TileMap/light/Sprite5/Light2D.visible = true
		$TileMap/light/Sprite6/Light2D.visible = true
		$TileMap/light/Sprite7/Light2D.visible = true
		$TileMap/light/Sprite8/Light2D.visible = true
		$TileMap/light/Sprite9/Light2D.visible = true
		$TileMap/light/Sprite10/Light2D.visible = true

	elif Global.horas >= 6: #esta função apaga as luzes dos postes ás 6h
		$TileMap/light/Sprite/Light2D.visible = false
		$TileMap/light/Sprite2/Light2D.visible = false
		$TileMap/light/Sprite3/Light2D.visible = false
		$TileMap/light/Sprite4/Light2D.visible = false
		$TileMap/light/Sprite5/Light2D.visible = false
		$TileMap/light/Sprite6/Light2D.visible = false
		$TileMap/light/Sprite7/Light2D.visible = false
		$TileMap/light/Sprite8/Light2D.visible = false
		$TileMap/light/Sprite9/Light2D.visible = false
		$TileMap/light/Sprite10/Light2D.visible = false
