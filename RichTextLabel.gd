extends RichTextLabel

const calum_maddox = preload("res://Imagens/Profiles_Dialogues/calum_maddox.png")
const goblin = preload("res://Imagens/Profiles_Dialogues/goblin.png")
const snow_reaper = preload("res://Imagens/Profiles_Dialogues/snow_reaper.png")
const desert_reaper = preload("res://Imagens/Profiles_Dialogues/desert_reaper.png")
const lava_golem = preload("res://Imagens/Profiles_Dialogues/lava_golem.png")

var dialogue_lvl_1 = [["Calum Maddox", "Quem é você? Onde está meu pai?"],
				["Goblin", "Meu nome não importa, já que você estará morto logo."],
				["Calum Maddox", "É o que veremos."],
				["Goblin", "Vejo que é corajoso, assim como seu pai, porém, ele não acabou muito bem, não é mesmo? HAHAHAHA"],
				["Calum Maddox", "Nunca mais fale do meu pai, ou será o seu fim."],
				["Goblin", "Cale-se, e lute!"],
				["Bem vindo a Calum's Journey! Para se movimentar pela tela, utilize as SETAS. Para matar os adversários, pule sobre eles, ou lançe uma magia utilizando ESPAÇO. No canto superior esquerdo, você encontrará informações de vida e mana do personagem. Ambas tem um limite de 5, sendo que a mana recarregará de 5 em 5 segundos. No canto superior direito, terá a contagem de inimigos mortos, seguido do quantidade de inimigos necessários para passar de nível. Para pausar, tecle ESC. Tenha um bom jogo!", ""]]
var dialogue_lvl_2 = [["Snow Reaper", "Vejo que matou os meus amigos."],
				["Calum Maddox", "Foi muito fácil, assim como será com você."],
				["Snow Reaper", "Cuidado com suas palavras garoto, elas podem matar-te."],
				["Calum Maddox", "Pouparei sua vida se me falar onde está meu pai."],
				["Snow Reaper", "Hahaha, você é insolente como ele."],
				["Calum Maddox", "Prefere do jeito dificil, então vamos."],
				["Snow Reaper", "É o seu fim garoto."]]
var dialogue_lvl_3 = [["Calum Maddox", "Não aguento mais vocês, onde está o meu pai?"],
				["Desert Reaper", "Se quer acha-lo, tera que passar por mim."],
				["Calum Maddox", "Vou manda-lo para onde seus irmãos estão."],
				["Desert Reaper", "Não sou fraco como eles."],
				["Calum Maddox", "Não importa, o derrotarei mesmo assim."]]
var dialogue_lvl_4 = [["Calum Maddox", "Finalmente o encontrei, miserável."],
				["Lava Golem", "Todo seu esforço foi em vão, você acabará como o seu pai."],
				["Calum Maddox", "E você como seus filhos."],
				["Lava Golem", "O que você fez com eles?"],
				["Calum Maddox", "O mesmo que farei com você agora."]]
var page = 0
var dialogue

func _ready():
	if $"../../..".name == "World":
		dialogue = dialogue_lvl_1
	elif $"../../..".name == "Lvl2":
		dialogue = dialogue_lvl_2
	elif $"../../..".name == "Lvl3":
		dialogue = dialogue_lvl_3
	elif $"../../..".name == "Lvl4":
		dialogue = dialogue_lvl_4
	$"../Name".set_bbcode(dialogue[page][0])
	set_bbcode(dialogue[page][1])
	set_visible_characters(0)
	set_process_input(true)
	$"../play_button".visible = false
	#get_tree().paused = true
	get_parent().visible = true
	if dialogue[page][0] == "Calum Maddox":
		$"../Profile".set_texture(calum_maddox)
	elif dialogue[page][0] == "Goblin":
		$"../Profile".set_texture(goblin)
	elif dialogue[page][0] == "Snow Reaper":
		$"../Profile".set_texture(snow_reaper)
	elif dialogue[page][0] == "Desert Reaper":
		$"../Profile".set_texture(desert_reaper)
	elif dialogue[page][0] == "Lava Golem":
		$"../Profile".set_texture(lava_golem)
	else:
		$"../Profile".set_texture(calum_maddox)

	
func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		if get_visible_characters() > get_total_character_count():
			if page < dialogue.size()-1:
				page += 1
				if dialogue[page][0] == "Calum Maddox":
					$"../Profile".set_texture(calum_maddox)
				elif dialogue[page][0] == "Goblin":
					$"../Profile".set_texture(goblin)
				elif dialogue[page][0] == "Snow Reaper":
					$"../Profile".set_texture(snow_reaper)
				elif dialogue[page][0] == "Desert Reaper":
					$"../Profile".set_texture(desert_reaper)
				elif dialogue[page][0] == "Lava Golem":
					$"../Profile".set_texture(lava_golem)
				else:
					$"../Profile".set_texture(calum_maddox)
				$"../Name".set_bbcode(dialogue[page][0])
				set_bbcode(dialogue[page][1])
				set_visible_characters(0)
				if page == dialogue.size()-1:
					$"../play_button".visible = true

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)

func _on_play_button_pressed():
	get_parent().visible = false

