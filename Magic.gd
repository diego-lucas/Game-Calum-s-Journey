extends Area2D

const SPEED = 400
var velocity = Vector2()
var direction = 1

func _ready():
	pass
	
func set_magic_direction(dir):
	direction = dir
	if dir == -1:
		$Sprite.flip_h = true
	
func _physics_process(delta):
	velocity.x = SPEED * delta * direction
	translate(velocity)
	$Sprite.play("shoot")

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Magic_body_entered(body):
	if body is StaticBody2D:
		if body.name != "Pai" and body.get_parent().name != "Moedas":
			body.dano()
			queue_free()
	if body.name == "TileMap":
		queue_free()
	print(body)
	print(body.name)
