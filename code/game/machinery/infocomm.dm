/obj/machinery/info_comm
	name = "Info-Communicator"
	desc = "What's new today?"
	icon = 'icons/obj/fauxmachines.dmi'
	icon_state = "machine5"
	density = 1
	anchored = 1
	unacidable = 1
	use_power = 0

	var/static/list/buttons = list("COMMUNICATE", "SUBORDINATES", "AUTHORITY", "ESCHATIZE", "SUPERSTITION", "FLAG")

	/obj/machinery/info_comm/attack_hand(mob/user)
		. = ..()
		if(.)
			return
		playsound(src, 'sound/deathnet/boop/done.ogg', 50, 1)
		var/choice = input(user, "You're met with an interface here...", "Info-Communicator") as null|anything in buttons
		if(!choice)
			return
		switch(choice)
			if("COMMUNICATE")
				var/list/guylol = list("person", "citizen", "monster", "HORROR", "specimen", "dweller", "wise guy")
				var/character_name = input(user, "Enter the name of the " + pick(guylol) + " you want to communicate with.", "Info-Communicator") as text|null
				playsound(src.loc, 'sound/deathnet/boop/done.ogg', 50, 1)
				if(!character_name)
					return
				var/mob/living/carbon/human/character = find_character(character_name)
				if(!character)
					user << "<span class='warning'>MISMATCH: NOT FOUND</span>"
					playsound(src, 'sound/deathnet/boop/fucked.ogg', 50, 1)
					return
				if(character.stat == DEAD)
					user << "<span class='warning'>MISMATCH: HUMAN IS DEAD</span>"
					playsound(src, 'sound/deathnet/boop/megafucked.ogg', 50, 1)
					return
				var/message = input(user, "Enter the cognition you wish to send.", "Info-Communicator") as text|null
				playsound(src, 'sound/deathnet/boop/process.ogg', 50, 1)
				var/list/huh = list("The fuck?", "What's this?", "Alright...", "Let's take a look here...", "Oh?")
				if(!message)
					return
				character << pick(huh) + " <span class='notice'>FROM: (<B>[user]</B>) -- CONTENT: (<B>[message]</B>)</span>"
				for(var/mob/M in hearers(7, character))
					M << 'sound/deathnet/menu/commie2.ogg'
					M << "[character] has received a message!"
			if("SUBORDINATES")
				playsound(src, 'sound/deathnet/boop/process.ogg', 50, 1)
				var/list/allowed_jobs = list("Minister", "Advisor", "Authority Chief", "Maintenance Chief")
				if(!(user.job in allowed_jobs))
					user << "<span class='danger'><b>INTERACTION DENIED - YOUR ACCESS LEVEL IS NOT HIGH ENOUGH.</b></span>"
					playsound(src, 'sound/deathnet/boop/fucked.ogg', 50, 1)
					return
				var/list/subordinates
				switch(user.job)
					if("Minister", "Advisor")
						subordinates = list("Advisor", "Informant", "Maintenance Chief", "Authority Chief")
					if("Authority Chief")
						subordinates = list("Authorityman", "Watchman")
					if("Maintenance Chief")
						subordinates = list("Maintainer", "Operational Apprentice")
				var/message = input(user, "Enter the orders you wish to send.", "Info-Communicator") as text|null
				playsound(src, 'sound/deathnet/boop/process.ogg', 50, 1)
				if(!message)
					return
				for(var/mob/living/carbon/human/H in world)
					if(H.job in subordinates)
						H << "<span class='notice'><B>NEW ORDERS</B> -- DETAILING: (<B>[user]</B>) -- CONTENT: (<B>[message]</B>)</span>"
						src << "[H] has received a message!"
						src << 'sound/deathnet/menu/commie2.ogg'
			if("AUTHORITY")
				src.visible_message("Authority request registered by <i>[user]</i>. <B>Remain where you are, and holster all weapons.</B>")
				for(var/mob/living/carbon/human/H in world)
					if(istype(H.head, /obj/item/clothing/head/helmet/authman))
						H << "<span class='notice'>[user] is requesting the help of the authority on <B>ECHELON [user.z]</B>!</span>"
						H << 'sound/deathnet/authoritycall.ogg'
				playsound(src, 'sound/deathnet/boop/process.ogg', 50, 1)
			if("SUPERSTITION")
				var/list/directionstuff = list("N", "W", "E", "S", "NW", "NE", "SW", "SE")
				user << "[rand(1,50)]" + pick(directionstuff)
				playsound(src, 'sound/deathnet/boop/process.ogg', 50, 1)
			if("ESCHATIZE", "FLAG",)
				user << "<span class='danger'><b>INTERACTION DENIED - YOUR ACCESS LEVEL IS NOT HIGH ENOUGH.</b></span>"
				playsound(src, 'sound/deathnet/boop/fucked.ogg', 50, 1)

	/obj/machinery/info_comm/proc/find_character(name)
		for(var/mob/living/carbon/human/H in world)
			if(H.real_name == name)
				return H
		return null