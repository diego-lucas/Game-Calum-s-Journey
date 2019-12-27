extends KinematicBody2D

export(int) var limit_b
export(int) var limit_t


const vida_5 = preload("res://Imagens/Health/vida_5.png")
const vida_4 = preload("res://Imagens/Health/vida_4.png")
const vida_3 = preload("res://Imagens/Health/vida_3.png")
const vida_2 = preload("res://Imagens/Health/vida_2.png")
const vida_1 = preload("res://Imagens/Health/vida_1.png")
const mana_5 = preload("res://Imagens/Mana/mana_5.png")
const mana_4 = preload("res://Imagens/Mana/mana_4.png")
const mana_3 = preload("res://Imagens/Mana/mana_3.png")
const mana_2 = preload("res://Imagens/Mana/mana_2.png")
const mana_1 = preload("res://Imagens/Mana/mana_1.png")
const dad_dialogue = preload("res://LastDialogue.tscn")

const MAGIC = preload("res://Magic.tscn")

const UP = Vector2(0, -1)
const GRAVITY = 20
const SPEED = 200
const JUMP_HEIGHT = -550
var motion = Vector2()
var life = 5
var mana = 5
var cont = 0
var dad


func _physics_process(delta):
	$Camera2D.limit_bottom = limit_b
	$Camera2D.limit_top = limit_t
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$Sprite.play("run")
		$Sprite.flip_h = false
		if sign($ShootRight.position.x) == -1:
			$ShootRight.position.x *= -1
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$Sprite.play("run")
		$Sprite.flip_h = true
		if sign($ShootLeft.position.x) == 1:
			$ShootLeft.position.x *= -1
	else:
		motion.x = 0
		$Sprite.play("idle")
		
	if Input.is_action_just_pressed("attack"):
		if mana >= 1:
			mana -= 1
			var magic = MAGIC.instance()
			get_parent().add_child(magic)
			if $Sprite.flip_h == false:
				magic.set_magic_direction(1)
				magic.position = $ShootRight.global_position
			elif $Sprite.flip_h == true:
				magic.set_magic_direction(-1)
				magic.position = $ShootLeft.global_position
				
	if mana == 5:
		get_node("CanvasLayer/Mana").set_texture(mana_5)
	elif mana == 4:
		get_node("CanvasLayer/Mana").set_texture(mana_4)
	elif mana == 3:
		get_node("CanvasLayer/Mana").set_texture(mana_3)
	elif mana == 2:
		get_node("CanvasLayer/Mana").set_texture(mana_2)
	elif mana == 1:
		get_node("CanvasLayer/Mana").set_texture(mana_1)
		get_node("CanvasLayer/Mana").visible = true
	elif mana == 0:
		get_node("CanvasLayer/Mana").visible = false
		
	if life == 0:
		if get_parent().filename == "res://World.tscn":
			get_tree().change_scene("res://Game_over_lvl1.tscn")
		elif get_parent().filename == "res://Lvl2.tscn":
			get_tree().change_scene("res://Game_over_lvl2.tscn")
		elif get_parent().filename == "res://Lvl3.tscn":
			get_tree().change_scene("res://Game_over_lvl3.tscn")
		elif get_parent().filename == "res://Lvl4.tscn":
			get_tree().change_scene("res://Game_over_lvl4.tscn")
		
		
	if mana < 5:
		cont += delta
		if cont >= 5:
			mana += 1
			cont = 0
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
	else:
		$Sprite.play("jump")
	
	motion = move_and_slide(motion, UP)


func _on_pes_body_entered(body):
	if body.name != "Pai" and body.get_parent().name != "Moedas":
		body.dano()
		motion.y = JUMP_HEIGHT


func _on_dano_body_entered(body):
	if body.name == "Pai":
		body.queue_free()
		dad = dad_dialogue.instance()
		$"../CanvasLayer3".add_child(dad)
	elif body.get_parent().name == "Moedas":
		body.queue_free()
	else:
		life -= 1
		if life == 5:
			get_node("CanvasLayer/HP").set_texture(vida_5)
		elif life == 4:
			get_node("CanvasLayer/HP").set_texture(vida_4)
		elif life == 3:
			get_node("CanvasLayer/HP").set_texture(vida_3)
		elif life == 2:
			get_node("CanvasLayer/HP").set_texture(vida_2)
		elif life == 1:
			get_node("CanvasLayer/HP").set_texture(vida_1)
		elif life == 0:
			if get_parent().filename == "res://World.tscn":
				get_tree().change_scene("res://Game_over_lvl1.tscn")
			elif get_parent().filename == "res://Lvl2.tscn":
				get_tree().change_scene("res://Game_over_lvl2.tscn")
			elif get_parent().filename == "res://Lvl3.tscn":
				get_tree().change_scene("res://Game_over_lvl3.tscn")
			elif get_parent().filename == "res://Lvl4.tscn":
				get_tree().change_scene("res://Game_over_lvl4.tscn")
		$anim.play("damage")

func _on_portal_local_body_entered(body):
	position.x = 5300