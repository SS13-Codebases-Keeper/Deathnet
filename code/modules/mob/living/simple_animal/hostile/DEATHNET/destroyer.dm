
/proc/getphoneticletter()
	return pick("Alpha", "Bravo", "Charlie", "Delta", "Echo", "Foxtrot", "Golf", "Hotel", "India", "Juliett", "Kilo", "Lima", "Mike", "November", "Oscar", "Papa", "Quebec", "Romeo", "Sierra", "Tango", "Uniform", "Victor", "Whiskey", "Xray", "Yankee", "Zulu")



/mob/living/simple_animal/destroyerbot
	name = "PERPETUOR-03"
	desc = "Automated safekeeping. Who knew life could be so idyllic with 300 kilogram death robots?"
	icon = 'icons/deathnet/destroyer.dmi'
	icon_state = "destroyerbot"
	icon_living = "destroyerbot"


	speak_chance = 30
	response_help = "pokes the"
	response_disarm = "gently pushes aside the"
	response_harm = "hits the"
	speak = list("INVESTIGATING SECTOR.", "SCANNING THE AREA.", "INTRUDER NEARBY.")
	emote_see = list("calibrates its sensors.","scans the horizon for threats.","sends out a communique.", "monitors operational life-signs.", "analyzes terrain data.", "adjusts its thermal shielding.", "reroutes to the phi-archive.", "decrypts a cosmic frequency.", "prepares for the inevitable.")
	a_intent = "harm"
	health = 9999999999
	maxHealth = 9999999999
	turns_per_move = 2
	status_flags = 7


	pixel_x = -8

	speaksound = FALSE

	var/mode = 0
	var/mob/living/carbon/human/target

	var/scantimer = 0

	var/time_between_scans = 50 // 5 seconds, give or take

	var/obj/effect/scanning/currentscan

	var/pacifytimer = 0

	var/pacification = 300 // 30 seconds

	var/deathtimer
	
	var/timetokill = 50 // 5 seconds exact

	var/password

	var/obj/item/weapon/grab/G

	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0

	faction = null

/mob/living/simple_animal/destroyerbot/New(loc)
	. = ..()
	password = "[getphoneticletter()] [rand(0,9)][rand(0,9)][rand(0,9)] [getphoneticletter()]"
	scantimer = world.time + 50

/mob/living/simple_animal/destroyerbot/examine()
	..()
	if(usr.client && is_dn_whitelisted(usr.client))
		usr << "You can tell their password is \"[password]\"."

/mob/living/simple_animal/destroyerbot/hear_say(var/message)
	. = ..()
	if(message == password && currentscan)
		currentscan.pass = 1
		qdel(currentscan)
		mode = 2
		pacifytimer = world.time + pacification
		scantimer = world.time + time_between_scans + rand(-10, 10)
		delaywalkagain(10)

/mob/living/simple_animal/destroyerbot/proc/delaywalkagain(var/delay = 0)
	spawn(delay)
		stop_automated_movement = 0

/mob/living/simple_animal/destroyerbot/proc/GrabMob(var/mob/living/M) //entirely ripped off our shitty scp 173
	if(M && M != src && ishuman(M))
		mode = 3
		G = new /obj/item/weapon/grab(src, M)

		playsound(loc, 'sound/weapons/thudswoosh.ogg', 50, 1, -1)
		visible_message("\red [src] grabs [M] by the neck and begins to tighten its hands on their head!")
		M << "\red <b>You feel [src] grab you by the neck!</b> Everything starts to go black..."

		G.state = GRAB_NECK
		target = M
		deathtimer = world.time + timetokill

		dir = get_dir(src, M)

/mob/living/simple_animal/destroyerbot/Move(atom/new_loc)
	var/d = get_dir(src, new_loc)
	var/is_diagonal = d & (d - 1)
	if(is_diagonal)
		// d1 and d2 are the component directions
		var/d1 = d & (NORTH | SOUTH)
		var/d2 = d & (EAST | WEST)
		// swap d1 and d2 50% of the time so we don't favor any direction
		if(prob(50))
			var/t = d1
			d1 = d2
			d2 = t

		// try moving in the d1 direction
		dir = d1
		if(step(src, d1))
			aftermoving(new_loc)
			return 1

		// if that fails, try moving in the d2 direction
		dir = d2
		if(step(src, d2))
			aftermoving(new_loc)
			return 1

		return 0

	// if the move wasn't diagonal
	else
		aftermoving(new_loc)
		return ..()
	//new /obj/effect/scanner(get_turf(src.loc))

/mob/living/simple_animal/destroyerbot/proc/aftermoving(atom/new_loc)
	playsound(src,"sound/deathnet/destroyer/heavy_footstep[pick("","1","2")].ogg",30,1)

/mob/living/simple_animal/destroyerbot/say(var/message)
	. = ..()
	switch(message)
		if("INVESTIGATING SECTOR.")
			playsound(src,"sound/deathnet/destroyer/investigatingsector.ogg",40,0)
		if("INTRUDER NEARBY.")
			playsound(src,"sound/deathnet/destroyer/intrudernearby.ogg",40,0)
		if("SCANNING THE AREA.")
			playsound(src,"sound/deathnet/destroyer/scanningthearea.ogg",40,0)
		if("PROVIDE IDENTIFICATION.")
			playsound(src,"sound/deathnet/destroyer/provideid.ogg",40,0)
		if("ACCESS DENIED.")
			playsound(src,"sound/deathnet/destroyer/accessdenied.ogg",40,0)
		else
			playsound(src,"sound/deathnet/destroyer/s[pick("1","2","3")].ogg",30,0)

/mob/living/simple_animal/destroyerbot/emote(var/message)
	. = ..()
	playsound(src,"sound/deathnet/destroyer/s[pick("1","2","3")].ogg",30,0)

/mob/living/simple_animal/destroyerbot/Process_Spacemove(var/check_drift = 0)
	return 1


/obj/effect/scanning
	name = "scanning"
	icon = 'icons/deathnet/scanhuman.dmi'
	icon_state = "scanning"
	anchored = 1
	mouse_opacity = 0
	plane = 2

	var/mob/living/carbon/human/target
	var/mob/living/simple_animal/destroyerbot/master
	var/pass = 0

/obj/effect/scanning/New()
	..()
	playsound(src,"sound/deathnet/destroyer/scan[pick("1","2")].ogg",40,0)
	spawn (30)
		alpha = 0
		master.say("PROVIDE IDENTIFICATION.")
		spawn(70)
			qdel(src)
	return

/obj/effect/scanning/Destroy()
	if(target && !pass)
		master.say("ACCESS DENIED.")
		target.dust()
		master.mode = 0
		master.delaywalkagain(15)
		master.scantimer = world.time + master.time_between_scans + rand(-10, 10)
	. = ..()

/obj/effect/scanning/Uncross(atom/movable/O, newloc)
	. = ..()

	if(O == target && !alpha == 0)
		qdel(src)


/obj/effect/scanner
	name = "scan"
	icon = 'icons/deathnet/scanner.dmi'
	icon_state = "scanner"
	anchored = 1
	mouse_opacity = 0
	pixel_x = -64
	pixel_y = -64

/obj/effect/scanner/New()
	..()
	playsound(src,"sound/deathnet/destroyer/sonar_ping.ogg",30,1)
	spawn (10)
		qdel(src)
	return

/mob/living/simple_animal/destroyerbot/proc/scan()
	new /obj/effect/scanner(src.loc)
	spawn(3)
		var/list/targets = oview(2,src)
		var/atom/A = locate(/mob/living/carbon/human) in targets
		var/mob/living/carbon/human/closest = A
		if(closest && !closest.stat)
			target = closest
			mode = 1
			stop_automated_movement = 1
			//playsound(src,"sound/deathnet/destroyer/provideid.ogg",40,0)
			var/obj/effect/scanning/effect = new /obj/effect/scanning(closest.loc)
			effect.master = src
			effect.target = closest
			currentscan = effect
			closest.Stun(5)
			dir = get_dir(src, closest)

/* i have to copy paste and butcher life code for this :)
mode 0 = wander
mode 1 = scanning
mode 2 = pacified
mode 3 = exterminate */


/mob/living/simple_animal/destroyerbot/Life()



	if(mode == 3)
		if(!G)
			mode = 0
		else
			playsound(src.loc,"sound/deathnet/destroyer/clack.ogg",rand(20, 30),1)
			if(world.time > deathtimer)
				var/datum/organ/external/head = target.get_organ("head")
				head.droplimb(override = TRUE, gibbed = TRUE)
				qdel(G)
				mode = 0
				delaywalkagain(15)
				scantimer = world.time + time_between_scans + rand(-10, 10)
				return
			if(prob(50))
				playsound(src,"sound/deathnet/destroyer/s[pick("1","2","3")].ogg",30,0)

	var/scanned = 0

	if(mode == 0 && world.time > scantimer)
		scan()
		scanned = 1
		scantimer = world.time + time_between_scans + rand(-10, 10)

	if(mode == 2 && world.time > pacifytimer)
		mode = 0



	// aanything below this is default life code

	if(stat == DEAD)
		if(health > 0)
			icon_state = icon_living
			dead_mob_list -= src
			living_mob_list += src
			stat = CONSCIOUS
			density = 1
		return 0


	if(health < 1)
		Die()

	if(health > maxHealth)
		health = maxHealth

	if(stunned)
		AdjustStunned(-100000)
	if(weakened)
		AdjustWeakened(-1000000)
	if(paralysis)
		AdjustParalysis(-1000000)

	//Movement
	if(!stop_automated_movement && wander && !anchored && (mode == 0 || mode == 2) && !scanned)
		if(isturf(src.loc) && !resting && !buckled && canmove)		//This is so it only moves if it's not inside a closet, gentics machine, etc.
			turns_since_move++
			if(turns_since_move >= turns_per_move)
				if(!(stop_automated_movement_when_pulled && pulledby)) //Soma animals don't move when pulled
					Move(get_step(src,pick(cardinal)))
					turns_since_move = 0

	//Speaking
	if(speak_chance && (mode == 0 || mode == 2))
		if(rand(0,200) < speak_chance)
			if(speak && speak.len)
				if((emote_hear && emote_hear.len) || (emote_see && emote_see.len))
					var/length = speak.len
					if(emote_hear && emote_hear.len)
						length += emote_hear.len
					if(emote_see && emote_see.len)
						length += emote_see.len
					var/randomValue = rand(1,length)
					if(randomValue <= speak.len)
						say(pick(speak))
					else
						randomValue -= speak.len
						if(emote_see && randomValue <= emote_see.len)
							emote(pick(emote_see),1)
						else
							emote(pick(emote_hear),2)
				else
					say(pick(speak))
			else
				if(!(emote_hear && emote_hear.len) && (emote_see && emote_see.len))
					emote(pick(emote_see),1)
				if((emote_hear && emote_hear.len) && !(emote_see && emote_see.len))
					emote(pick(emote_hear),2)
				if((emote_hear && emote_hear.len) && (emote_see && emote_see.len))
					var/length = emote_hear.len + emote_see.len
					var/pick = rand(1,length)
					if(pick <= emote_see.len)
						emote(pick(emote_see),1)
					else
						emote(pick(emote_hear),2)

/mob/living/simple_animal/destroyerbot/attack_animal(mob/living/simple_animal/M as mob)

	visible_message("\red <B>[M]</B> attemps to touch [src]!", 1)
	M.dust()

/*mob/living/simple_animal/bullet_act(var/obj/item/projectile/Proj)
	if(!Proj)	return
	adjustBruteLoss(Proj.damage)
	return 0*/

/mob/living/simple_animal/destroyerbot/attack_hand(mob/living/carbon/human/M as mob)

	if(M.a_intent == "help" && health > 0 && mode == 2)
		visible_message("\blue [M] pats [src] on the head.")

	else
		visible_message("\red <B>[M]</B> touches [src]!", 1)
		GrabMob(M)

	return

/mob/living/simple_animal/destroyerbot/attack_larva(mob/living/carbon/alien/larva/M as mob)

	visible_message("\red <B>[M]</B> attemps to touch [src]!", 1)
	M.dust()


/mob/living/simple_animal/destroyerbot/attack_slime(mob/living/carbon/slime/M as mob)
	visible_message("\red <B>[M]</B> attemps to touch [src]!", 1)
	M.dust()


/mob/living/simple_animal/destroyerbot/attackby(var/obj/item/O as obj, var/mob/M as mob)  //Marker -Agouri
	if(!ishuman(M))
		visible_message("\red <B>[M]</B> attemps to touch [src]!", 1)
		M.dust()

	else
		visible_message("\red <B>[M]</B> touches [src] with the [O]!", 1)
		GrabMob(M)


	/*if(istype(O, /obj/item/stack/medical))

		if(stat != DEAD)
			var/obj/item/stack/medical/MED = O
			if(health < maxHealth)
				if(MED.amount >= 1)
					adjustBruteLoss(-MED.heal_brute)
					MED.amount -= 1
					if(MED.amount <= 0)
						del(MED)
					for(var/mob/M in viewers(src, null))
						if ((M.client && !( M.blinded )))
							M.show_message("\blue [user] applies the [MED] on [src]")
		else
			user << "\blue this [src] is dead, medical items won't bring it back to life."
	if(meat_type && (stat == DEAD))	//if the animal has a meat, and if it is dead.
		if(istype(O, /obj/item/weapon/kitchenknife) || istype(O, /obj/item/weapon/butch))
			new meat_type (get_turf(src))
			if(prob(95))
				del(src)
				return
			gib()
	else
		if(O.force)
			var/damage = O.force
			if (O.damtype == HALLOSS)
				damage = 0
			adjustBruteLoss(damage)
			for(var/mob/M in viewers(src, null))
				if ((M.client && !( M.blinded )))
					M.show_message("\red \b [src] has been attacked with the [O] by [user]. ")
		else
			usr << "\red This weapon is ineffective, it does no damage."
			for(var/mob/M in viewers(src, null))
				if ((M.client && !( M.blinded )))
					M.show_message("\red [user] gently taps [src] with the [O]. ")*/
