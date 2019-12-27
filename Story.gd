extends RichTextLabel

var dialogue = ["No ano de 852 D.C, chegou ao conhecimento da população que existiam cristais de poder espalhados pelo mundo, porém até o momento, ninguém tinha conseguido acesso a qualquer um deles. O arqueólogo Ming, um aventureiro ambicioso que sempre buscou mais poder, começou uma busca incessante pelo cristal negro, o mais poderoso, mas que possuía uma maldição desconhecida. Ao encontrá-lo Ming foi o primeiro a tocá-lo, espalhando uma onda de energia pelo mundo criando criaturas sedentas de sangue humano, transformando o próprio arqueólogo em um deles, que mais tarde ficaria conhecido como Imperador Ming, o rei dos monstros.",
				"Então, com o aumento drástico da mortalidade humana em razão dos novos predadores, um grupo de pessoas partiram em busca do cristal da luz, que deu capacidades mágicas e sobre-humanas a eles para poderem combater seus inimigos. Com isso, esse grupo de pessoas agora providas de magia, ficaram conhecidos como caçadores, e começaram a caçar os monstros pelo mundo. Essa energia antes restrita ao grupo inicial de guerreiros, foi passada de geração em geração para seus filhos, e assim nasceu Callum Maddox, filho de John Maddox, um dos caçadores originais.",
				"Aos seus 5 anos, Callum recebeu a notícia de que seu pai foi capturado durante uma caçada e dado como morto. Ao ficar sabendo disso, ele começou um treinamento intenso para se tornar um caçador e partir em busca do seu pai. Quando completou 16 anos, depois 11 anos de treino, ele partiu em busca do seu pai para que pudesse reestabelecer sua família."]
var page = 0

func _ready():
	set_bbcode(dialogue[page])
	set_visible_characters(0)
	set_process_input(true)
	$"../play_button".visible = false
	$"../..".visible = true
	
func _input(event):
	if get_visible_characters() > get_total_character_count():
		if Input.is_action_just_pressed("ui_accept"):
			if get_visible_characters() > get_total_character_count():
				if page < dialogue.size()-1:
					page += 1
					set_bbcode(dialogue[page])
					set_visible_characters(0)
					if page == dialogue.size()-1:
						$"../play_button".visible = true
						$"../Skip".visible = false
	else:
		if Input.is_action_just_pressed("ui_accept"):
			set_visible_characters(len(dialogue[page]))

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)

func _on_play_button_pressed():
	get_tree().change_scene("res://Menu_Lvl1.tscn")



func _on_Skip_pressed():
	get_tree().change_scene("res://Menu_Lvl1.tscn")
