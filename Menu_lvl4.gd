extends Control


func _on_Quit_pressed():
	get_tree().quit()


func _on_Nvel_1_pressed():
	get_tree().change_scene("res://World.tscn")

func _on_Nvel_2_pressed():
	get_tree().change_scene("res://Lvl2.tscn")

func _on_Nvel_3_pressed():
	get_tree().change_scene("res://Lvl3.tscn")

func _on_Nvel_4_pressed():
	get_tree().change_scene("res://Lvl4.tscn")
