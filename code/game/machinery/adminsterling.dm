/obj/machinery/admin_sterling
	name = "Admin-Sterling Interface"
	desc = "They beg for orders. Time to give the people what they want."
	icon = 'icons/obj/fauxmachines.dmi'
	icon_state = "broadcaster2"
	density = 0
	anchored = 1
	unacidable = 1
	use_power = 0
	var/message

	New()
		..()
		src.set_dir()

	/obj/machinery/admin_sterling/attack_hand(mob/user)
		. = ..()
		if(.)
			return
		if(user.job == "Minister" || user.job == "Advisor")
			message = input(user, "Broadcast what needs to be heard, great one.", "Message") as text
			world << "<span class='danger'> ATTENTION! <i>[message]</i></span>"
			world << 'sound/deathnet/boop/declaration.ogg'
			return TRUE
		else
			user << "<span class='danger'><b>INTERACTION DENIED - YOUR ACCESS LEVEL IS NOT HIGH ENOUGH.</b></span>"
			return FALSE

	proc/set_dir()
		switch(dir)
			if(NORTH)
				pixel_y = -15
			if(SOUTH)
				pixel_y = 15
			if(EAST)
				pixel_x = 15
			if(WEST)
				pixel_x = -15




