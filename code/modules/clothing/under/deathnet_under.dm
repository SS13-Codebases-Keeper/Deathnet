/obj/item/clothing/under/rank/minister
	name = "minister's attire"
	desc = "A high-ranking officer's ceremonial uniform. Just looking at it makes you want to <b>respect</b> it."
	icon_state = "minister"
	item_color = "minister"
	armor = list(melee = 10, bullet = 10, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9

/obj/item/clothing/under/rank/advisor
	name = "advisor's attire"
	desc = "Nod along and you'll be comfortable."
	icon_state = "advisor"
	item_color = "advisor"
	armor = list(melee = 10, bullet = 10, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9

/obj/item/clothing/under/rank/authchf
	name = "authority chief's fatigues"
	desc = "Power, respect, loyalty."
	icon_state = "authchf"
	item_color = "authchf"
	armor = list(melee = 20, bullet = 20, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9

/obj/item/clothing/under/rank/authman
	name = "authorityman's fatigues"
	desc = "Fear, terror, starvation."
	icon_state = "authman"
	item_color = "authman"
	armor = list(melee = 20, bullet = 20, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9

/obj/item/clothing/under/rank/maintainer
	name = "maintenance suit"
	desc = "They say this thing is rated for SUN rays. You do not dare to try."
	icon_state = "maintainer"
	item_color = "maintainer"
	armor = list(melee = 20, bullet = 20, laser = 100, energy = 100, bomb = 0, bio = 100, rad = 100)
	siemens_coefficient = 0.9

/obj/item/clothing/under/rank/maintapp
	name = "apprentice suit"
	desc = "You are too cheap for a black suit."
	icon_state = "maintapp"
	item_color = "maintapp"
	armor = list(melee = 10, bullet = 10, laser = 100, energy = 100, bomb = 0, bio = 100, rad = 100)
	siemens_coefficient = 0.9

/obj/item/clothing/under/rank/watchman
	name = "watchman's attire"
	desc = "We know everything."
	icon_state = "watchman"
	item_color = "watchman"
	armor = list(melee = 10, bullet = 10, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9

/obj/item/clothing/under/rank/liaison
	name = "liaison's suit"
	desc = "A perfume-doused suit for a dapper man."
	icon_state = "liaison"
	item_color = "liaison"
	armor = list(melee = 5, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9

/obj/item/clothing/under/rank/advocate
	name = "advocate's attire"
	desc = "Right attitude for the right hand man."
	icon_state = "advocate"
	item_color = "advocate"
	armor = list(melee = 5, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9

/obj/item/clothing/under/rank/practitioner
	name = "practitioner's scrubs"
	desc = "Were these ever cleaned?"
	icon_state = "practitioner"
	item_color = "practitioner"
	armor = list(melee = 5, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9

/obj/item/clothing/under/rank/psyker
	name = "psyker's rags"
	desc = "They are coming for you. You should start running."
	icon_state = "psyker"
	item_color = "psyker"
	armor = list(melee = 30, bullet = 30, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	
/obj/item/clothing/under/rank/candyman
	name = "candyman's overalls"
	desc = "He certainly can."
	icon_state = "candyman"
	item_color = "candyman"
	armor = list(melee = 5, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	
/obj/item/clothing/under/rank/informant
	name = "informant's suit"
	desc = "You have no friends out here."
	icon_state = "informant"
	item_color = "informant"
	armor = list(melee = 5, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9

/obj/item/clothing/under/rank/amuser
	name = "seifuku"
	desc = "Sexy! Cute! Erotic! UOOOOOHH!!!"
	icon_state = "amuser"
	item_color = "amuser"
	armor = list(melee = 5, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	
/obj/item/clothing/under/rank/ltnt
	name = "lieutenant's outfit"
	desc = "Ten years in the joint made you a fucking pussy!"
	icon_state = "ltnt"
	item_color = "ltnt"
	armor = list(melee = 5, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9

/obj/item/clothing/under/rank/gazer
	name = "beautiful clothing"
	desc = "I have no idea what you are talking about. You sound insane."
	icon_state = "gazer"
	item_color = "gazer"
	canremove = 0
	armor = list(melee = 50, bullet = 50, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9




////colored worker jammies

/obj/item/clothing/under/rank/worker //Default, brown color, lame
	name = "worker fatigues"
	desc = "A grime and grease covered set of lame fabric. You are <b>useless</b>."
	icon_state = "worker"
	item_color = "worker"
	armor = list(melee = 5, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	
	New()

		if(prob(50))
			icon_state = "worker"
			item_color = "worker"

		if(prob(20))
			icon_state = "workergreen"
			item_color = "workergreen"
		
		if(prob(20))
			icon_state = "workerblue"
			item_color = "workerblue"
		
		if(prob(10))
			icon_state = "workerblack"
			item_color = "workerblack"
