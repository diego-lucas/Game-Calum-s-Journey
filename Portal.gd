extends Area2D

export(String, FILE, "*.tscn") var cenas
export(int) var time_limit

var tot_coins
var cont_coins
var tot_enemies
var cont_enemies
var num_open
var pos_portal
var string
var segundos = 0
var minutos = 0
var segundos_l = 0
var minutos_l = 0
var cont1 = 0
var segundos_txt
var minutos_txt

var cont2

func _ready():
	cont2 = int(time_limit)
	tot_enemies = get_parent().get_node("Inimigos").get_child_count()
	tot_coins = get_parent().get_node("Moedas").get_child_count()
	num_open = int(tot_enemies * 0.9)
	pos_portal = $".".position.y
	$".".position.y = -1000
	while time_limit > 0:
		if time_limit >= 60:
			minutos_l += 1
			time_limit -= 60
		else:
			segundos_l = time_limit
			time_limit = 0
	if minutos_l <= 9:
		minutos_l = "0" + str(minutos_l)
	else:
		minutos_l = str(minutos_l)
	if segundos_l <= 9:
		segundos_l = "0" + str(segundos_l)
	else:
		segundos_l = str(segundos_l)
	time_limit = minutos_l + ":" + segundos_l
	
	
func _process(delta):
	cont_enemies = get_parent().get_node("Inimigos").get_child_count()
	cont_coins = get_parent().get_node("Moedas").get_child_count()
	if tot_enemies - cont_enemies >= 4 and tot_coins - cont_coins >= 4:
		$".".position.y = pos_portal
		if get_parent().name == "Lvl4":
			$"../TileMap Rock".set_cell(275, 8, -1)
			$"../TileMap Rock".set_cell(275, 9, -1)
			$"../TileMap Rock".set_cell(275, 10, -1)
			$"../TileMap Rock".set_cell(276, 8, -1)
			$"../TileMap Rock".set_cell(276, 9, -1)
			$"../TileMap Rock".set_cell(276, 10, -1)
			$"../TileMap Rock".set_cell(275, 7, -1)
			$"../TileMap Rock".set_cell(276, 7, -1)
	string = str(tot_enemies - cont_enemies) + " / " + str(num_open)
	get_node("CanvasLayer/Label").text = string
	get_node("CanvasLayer/Coins").text = str(tot_coins - cont_coins) + " / " + str(int(tot_coins*0.9))
	segundos += delta
	cont1 += delta
	if segundos >= 60:
		segundos = 0
		minutos += 1
	if cont1 >= cont2:
		$"../Player".life = 0
	if cont1 >= cont2 - 20:
		get_node("CanvasLayer/time").add_color_override("font_color", Color(255,0,0))
	elif cont1 >= cont2 - 40:
		get_node("CanvasLayer/time").add_color_override("font_color", Color(255,255,0))
	if segundos <= 10:
		segundos_txt = "0" + str(int(segundos))
	else:
		segundos_txt = str(int(segundos))
	if minutos <= 9:
		minutos_txt = "0" + str(minutos)
	else:
		minutos_txt = str(minutos)
	get_node("CanvasLayer/time").text = minutos_txt + ":" + segundos_txt + " / " + time_limit
	
func _on_Portal_body_entered(body):
	get_tree().change_scene(cenas)
