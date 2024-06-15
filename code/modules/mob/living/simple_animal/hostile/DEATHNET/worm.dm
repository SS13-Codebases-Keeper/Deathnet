/mob/living/simple_animal/hostile/shoeworm
	name = "nuisance"
	desc = "A disgusting vermin that plagues the area."
	icon = 'icons/deathnet/worm.dmi'
	icon_state = "rat_still"
	icon_living = "rat_still"
	icon_dead = "rat_dead"

	layer = TURF_LAYER+0.2

	friendly = "harmlessly rolls into"
	maxHealth = 10
	health = 10
	harm_intent_damage = 0
	melee_damage_lower = 0
	melee_damage_upper = 0
	attacktext = "barrels into"
	a_intent = "help"

	status_flags = CANPUSH

	destroy_surroundings = 0

	search_objects = 1
	wanted_objects = list()

	robust_searching = 1
	stat_attack = 2

	vision_range = 9
	aggro_vision_range = 9
	idle_vision_range = 9
	move_to_delay = 5

	var/list/shoeseaten = list()
	var/obj/item/shoestorage // dont ask me why this works
	var/digesttimer
	//var/tameness

/mob/living/simple_animal/hostile/shoeworm/New()
	. = ..()
	wanted_objects = typesof(/obj/item/clothing/shoes)
	shoestorage = new

/mob/living/simple_animal/hostile/shoeworm/Move(atom/new_loc)
	if(!stat)
		flick("rat_moving", src)
		spawn(5)
		return ..()
	else
		..()

/mob/living/simple_animal/hostile/shoeworm/FindTarget()

	. = ..()
	if(.)
		if(target && stance != HOSTILE_STANCE_TIRED)
			if(istype(target, /obj/item/clothing/shoes))
				visible_message("<span class='danger'>The [src.name] looks at [target.name] with hungry eyes.</span>")
				stance = HOSTILE_STANCE_ATTACK
				stop_automated_movement = 1
				return
			if(ishuman(target))
				var/mob/living/carbon/human/H = target
				if(H.shoes)
					stance = HOSTILE_STANCE_ATTACK
					visible_message("<span class='danger'>The [src.name] looks at [target.name]'s shoes with hungry eyes.</span>")
					stop_automated_movement = 1
					return
				else
					stance = HOSTILE_STANCE_TIRED
					retreat_distance = 9
					minimum_distance = 9
					digesttimer = world.time + 100
					return

/mob/living/simple_animal/hostile/shoeworm/AttackingTarget()
	if(istype(target, /obj/item/clothing/shoes))
		visible_message("<span class='danger'>[src] eats [target] off the floor!</span>")
		stance = HOSTILE_STANCE_TIRED
		stop_automated_movement = 0
		retreat_distance = 7
		minimum_distance = 7
		digesttimer = world.time + 300 + rand(-50, 50)
		shoeseaten += target
		var/obj/item/shoe = target
		shoe.loc = shoestorage // ????
		target = null
		return
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		if(H.shoes)
			visible_message("<span class='danger'>[src] eats [H.shoes] right off [H]'s feet!</span>")
			stop_automated_movement = 0
			var/obj/item/clothing/shoes/shoe = H.shoes
			H.drop_from_inventory(shoe)
			H.shoes = null
			shoe.loc = shoestorage
			H.update_inv_shoes()
			H.update_icons()
			shoeseaten += shoe
		stance = HOSTILE_STANCE_TIRED
		retreat_distance = 9
		minimum_distance = 9
		digesttimer = world.time + 300 + rand(-50, 50)
		target = null
		return
	

/mob/living/simple_animal/hostile/shoeworm/adjustBruteLoss(var/damage)
	..(damage)
	if(!stat && search_objects < 3)
		if(!stance == HOSTILE_STANCE_TIRED)
			retreat_distance = 9
			minimum_distance = 9
			stance = HOSTILE_STANCE_TIRED
			digesttimer = world.time + 300

// im going to gut life code again

/mob/living/simple_animal/hostile/shoeworm/Life()
	. = ..()
	if(!.)
		return

	if(!stat)
		switch(stance)
			if(HOSTILE_STANCE_IDLE)
				target = FindTarget()
				if(!target)
					stop_automated_movement = 0

			if(HOSTILE_STANCE_ATTACK)
				MoveToTarget()

			if(HOSTILE_STANCE_ATTACKING)
				AttackTarget()

	if(stance == HOSTILE_STANCE_TIRED)
		target = FindTarget()
		if(target && ishuman(target))
			stop_automated_movement = 1
			MoveToTarget()
		else
			stop_automated_movement = 0
		if(world.time > digesttimer)
			stance = HOSTILE_STANCE_IDLE
			if(shoeseaten)
				for(var/obj/item/clothing/shoes/shoe in shoeseaten)
					qdel(shoe)
					new /obj/item/weapon/reagent_containers/food/snacks/nutribar(src.loc)
					new /obj/effect/decal/cleanable/blood/goo/splat(src.loc)
					playsound(loc, 'sound/effects/splat.ogg', 30, 1)
			retreat_distance = 0
			minimum_distance = 0


/obj/effect/decal/cleanable/blood/goo
	name = "viscous goo"
	desc = "A person sees a disgusting mass. A dweller sees sustenance."
	basecolor="#18181f"
	color = "#18181f"
	icon = 'icons/deathnet/gooshit.dmi'
	icon_state = "goo"
	amount = 2

/obj/effect/decal/cleanable/blood/goo/dry()
	return

/obj/effect/decal/cleanable/blood/goo/update_icon()
	return

/obj/effect/decal/cleanable/blood/goo/HasEntered(mob/living/carbon/human/H)
	..()
	icon_state = "goo_splat"

/obj/effect/decal/cleanable/blood/goo/splat
	icon_state = "goo_splat"

/obj/effect/decal/cleanable/blood/goo/splat/edible
	amount = 5

/obj/effect/decal/cleanable/blood/goo/splat/edible/attack_hand(mob/living/carbon/human/user)
	..()
	if(amount)
		user << "\blue You begin to dig your hands into \the [src]..."
		if(do_after(user, 30))
			user.put_in_hands(new /obj/item/weapon/reagent_containers/food/snacks/nutribar(user))


/obj/effect/decal/cleanable/wall_grime
	name = "gooey grime"
	desc = "Icky, viscous grime hanging off the walls."
	density = 0
	anchored = 1
	layer = 3
	icon = 'icons/deathnet/gooshit.dmi'
	icon_state = "grime1"

/obj/effect/decal/cleanable/wall_grime/topleft
	icon_state = "grime1"

/obj/effect/decal/cleanable/wall_grime/top
	icon_state = "grime2"

/obj/effect/decal/cleanable/wall_grime/topright
	icon_state = "grime3"

/obj/effect/decal/cleanable/wall_grime/right
	icon_state = "grime4"

/obj/effect/decal/cleanable/wall_grime/bottomright
	icon_state = "grime5"

/obj/effect/decal/cleanable/wall_grime/bottom
	icon_state = "grime6"

/obj/effect/decal/cleanable/wall_grime/bottomleft
	icon_state = "grime7"

/obj/effect/decal/cleanable/wall_grime/left
	icon_state = "grime8"