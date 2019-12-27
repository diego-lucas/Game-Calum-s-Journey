extends RichTextLabel

const calum_maddox = preload("res://Imagens/Profiles_Dialogues/calum_maddox.png")
const john = preload("res://Imagens/Profiles_Dialogues/john_maddox.png")


var dialogue = [["Calum Maddox", "Não acredito... É você mesmo, pai!!?"],
				["John Maddox", "Meu filho... veja só o homem que você se tornou, um caçador incrível!! Não posso acreditar que conseguiu me encontrar depois de todos esses anos."],
				["Calum Maddox", "Pai, que saudades!!! Sempre acreditei que um dia te encontraria e reestabeleceria nossa família. A mamãe e a mana estão te esperando em casa!"],
				["John Maddox", "Mal posso esperar para reve-las, estou com saudade de todos... Muito obrigado meu filho, por nunca ter desistido de mim... Eu te amo, meu filho!"],
				["Calum Maddox", "Pai... Eu nunca poderia ter desistido de você... Eu também te amo pai!"],
				["John Maddox", "Vamos enfim retornar para casa, e ter um encontro de família completo outra vez."],
				["",""]]

var pag = 0

func _ready():
	$"../Name".set_bbcode(dialogue[pag][0])
	set_bbcode(dialogue[pag][1])
	set_visible_characters(0)
	set_process_input(true)
	get_parent().visible = true
	if dialogue[pag][0] == "Calum Maddox":
		$"../Profile".set_texture(calum_maddox)
	elif dialogue[pag][0] == "John Maddox":
		$"../Profile".set_texture(john)
	else:
		$"../Profile".set_texture(calum_maddox)
	get_parent().visible = true

func _input(event):
	if get_visible_characters() > get_total_character_count():
		if Input.is_action_just_pressed("ui_accept"):
			if get_visible_characters() > get_total_character_count():
				if pag < dialogue.size()-1:
					pag += 1
					if dialogue[pag][0] == "Calum Maddox":
						$"../Profile".set_texture(calum_maddox)
					elif dialogue[pag][0] == "John Maddox":
						$"../Profile".set_texture(john)
					else:
						$"../Profile".set_texture(calum_maddox)
					$"../Name".set_bbcode(dialogue[pag][0])
					set_bbcode(dialogue[pag][1])
					set_visible_characters(0)
					if pag == dialogue.size():
						if Input.is_action_just_pressed("ui_accept"):
							$"..".visible = false
	if pag == dialogue.size()-1:
		if Input.is_action_just_pressed("ui_accept"):
			$"..".visible = false
				

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)