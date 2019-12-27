extends StaticBody2D

var flip = true
var posicao_inicial
var posicao_final
var velocidade = 1


func _ready():
	$Sprite.play("walk")
	posicao_inicial = $".".position.x
	posicao_final = posicao_inicial + 100
	
func _process(delta):
	
	
	if (posicao_inicial <= posicao_final and flip):
		$".".position.x += velocidade
		$Sprite.flip_h = false
		if ($".".position.x >= posicao_final):
			flip = false
			
	if ($".".position.x >= posicao_inicial and !flip):
		$".".position.x -= velocidade
		$Sprite.flip_h = true
		if ($".".position.x <= posicao_inicial):
			flip = true
			

func dano():
	get_node("anim").play("die")
	velocidade = 0
	$Sprite.play("die")
	

func die():
	$".".queue_free()
	