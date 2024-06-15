/mob/living/simple_animal/nuisance
	name = "nuisance"
	real_name = "nuisance"
	desc = "A small, dark worm. A favorite among pet enthusiasts for their warm nature."
	icon_state = "nuisance"
	icon_living = "nuisance"
	icon_dead = "nuisance_dead"
	speak = list("Squirm!","SQUIRM!","Squeek?")
	speak_emote = list("squirms","squirms","squirms")
	emote_hear = list("squirms","squirms","squirms")
	emote_see = list("sqirms in a circle", "shakes", "scritches")
	pass_flags = PASSTABLE
	small = 1
	speak_chance = 1
	turns_per_move = 5
	see_in_dark = 6
	maxHealth = 5
	health = 5
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat
	response_help  = "pets the"
	response_disarm = "gently pushes aside the"
	response_harm   = "stamps on the"
	density = 0
	var/body_color //brown, gray and white, leave blank for random
	layer = MOB_LAYER
	min_oxy = 16 //Require atleast 16kPA oxygen
	minbodytemp = 223		//Below -50 Degrees Celcius
	maxbodytemp = 323	//Above 50 Degrees Celcius
	universal_speak = 0
	universal_understand = 1

/mob/living/simple_animal/nuisance/Life()
	..()
	if(!stat && prob(speak_chance))
		for(var/mob/M in view())
			M << 'sound/effects/nuisancesqueek.ogg'

	if(!ckey && stat == CONSCIOUS && prob(0.5))
		stat = UNCONSCIOUS
		icon_state = "nuisance_[body_color]_sleep"
		wander = 0
		speak_chance = 0
		//snuffles
	else if(stat == UNCONSCIOUS)
		if(ckey || prob(1))
			stat = CONSCIOUS
			icon_state = "nuisance_[body_color]"
			wander = 1
		else if(prob(5))
			emote("snuffles")

/mob/living/simple_animal/nuisance/New()
	..()

	verbs += /mob/living/proc/ventcrawl
	verbs += /mob/living/proc/hide

	name = "[name] ([rand(1, 1000)])"
	if(!body_color)
		body_color = pick( list("brown","gray","white") )
	icon_state = "nuisance_[body_color]"
	icon_living = "nuisance_[body_color]"
	icon_dead = "nuisance_[body_color]_dead"
	desc = "It's a small [body_color] rodent, often seen hiding in maintenance areas and making a nuisance of itself."


/mob/living/simple_animal/nuisance/proc/splat()
	src.health = 0
	src.stat = DEAD
	src.icon_dead = "nuisance_[body_color]_splat"
	src.icon_state = "nuisance_[body_color]_splat"
	layer = MOB_LAYER
	if(client)
		client.time_died_as_nuisance = world.time


/mob/living/simple_animal/nuisance/start_pulling(var/atom/movable/AM)//Prevents mouse from pulling things
	src << "<span class='warning'>You are too small to pull anything.</span>"
	return

/mob/living/simple_animal/nuisance/HasEntered(AM as mob|obj)
	if( ishuman(AM) )
		if(!stat)
			var/mob/M = AM
			M << "\blue \icon[src] Squeek!"
			M << 'sound/effects/nuisancesqueek.ogg'
	..()

/mob/living/simple_animal/nuisance/Die()
	layer = MOB_LAYER
	if(client)
		client.time_died_as_nuisance = world.time
	..()

/*
 * nuisance types
 */

/mob/living/simple_animal/nuisance/black
	body_color = "black"
	icon_state = "nuisance_white"
