extends Control

export(String, FILE, "*.tscn") var menu

func _ready():
	pass
	
func _process(delta):
	
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = not get_tree().paused
		visible = not visible

func _on_Quit_pressed():
	get_tree().quit()


func _on_Menu_pressed():
	get_tree().paused = false
	get_tree().change_scene(menu)


func _on_Retomar_pressed():
	get_tree().paused = false
	visible = not visible
