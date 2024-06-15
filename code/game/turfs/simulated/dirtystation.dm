//Janitors!  Janitors, janitors, janitors!  -Sayu


//Conspicuously not-recent versions of suspicious cleanables


/obj/effect/decal/cleanable/dust
	name = "dust"
	desc = "Someone should clean that up."
	icon = 'icons/effects/blood.dmi' //Don't ask why it's there.
	density = 0
	anchored = 1
	icon_state = "dust"
	mouse_opacity = 0

/obj/effect/decal/cleanable/cobweb1
	name = "cobweb"
	desc = "Someone should clean that up."
	icon = 'icons/effects/blood.dmi'
	density = 0
	anchored = 1
	icon_state = "cobweb1"

/obj/effect/decal/cleanable/cobweb2
	name = "cobweb"
	desc = "Someone should clean that up."
	icon = 'icons/effects/blood.dmi'
	density = 0
	anchored = 1
	icon_state = "cobweb2"

/obj/effect/decal/cleanable/blood/old
	name = "dried blood"
	desc = "Looks like it's been here a while.  Eew."
//	basecolor="#FFFFFF"
//	color="#FFFFFF"
	New()
		..()
		icon_state += "-old"


/obj/effect/decal/cleanable/vomit/dryblood
	name = "crusty dried blood"
	desc = "You wonder how many weeks has it been since this was spilled."
	icon_state = "dryblood_1"
	random_icon_states = list("dryblood_1", "dryblood_2", "dryblood_3", "dryblood_4", "dryblood_5", "dryblood_6", "dryblood_7")


/obj/effect/decal/cleanable/blood/gibs/old
	name = "old rotting gibs"
	desc = "Oh god, why didn't anyone clean this up?  It smells terrible."
//	basecolor="#FFFFFF"
	New()
		..()
		icon_state += "-old"
		dir = pick(1,2,4,8)

/obj/effect/decal/cleanable/vomit/old
	name = "crusty dried vomit"
	desc = "You try not to look at the chunks, and fail."
	New()
		..()
		icon_state += "-old"

/obj/effect/decal/remains/robot/old
	name = "dusty robot debris"
	desc = "Looks like nobody has touched this in a while."


//Making the station dirty, one tile at a time. Called by master controller's setup_objects

/turf/simulated/floor/proc/MakeDirty()
	var/trash = pick(/obj/item/trash/raisins,
				/obj/item/trash/candy,
				/obj/item/trash/cheesie,
				/obj/item/trash/chips,
				/obj/item/trash/syndi_cakes,
				/obj/item/trash/sosjerky,
				/obj/item/weapon/reagent_containers/food/drinks/bottle/empty,
				/obj/item/weapon/cigbutt)
	if(prob(66))	//fastest possible exit 2/3 of the time
		return

	// These look weird if you make them dirty
	if(istype(src, /turf/simulated/floor/carpet) || istype(src, /turf/simulated/floor/grass) || istype(src, /turf/simulated/floor/beach) || istype(src, /turf/simulated/floor/holofloor) || istype(src, /turf/simulated/floor/plating/snow) || istype(src, /turf/simulated/floor/plating/ironsand))
		return

	if(locate(/obj/structure/grille) in contents)
		return

	var/area/A = loc

				//zero dirt
	if(!istype(A) || istype(A, /area/centcom) || istype(A, /area/holodeck) || istype(A, /area/library) || istype(A, /area/janitor) || istype(A, /area/chapel) || istype(A, /area/mine/explored) || istype(A, /area/mine/unexplored) || istype(A, /area/solar) || istype(A, /area/atmos) || istype(A, /area/medical/virology))
		return

				//high dirt - 1/3
	if(istype(A, /area/toxins/test_area) || istype(A, /area/mine/production) || istype(A, /area/mine/living_quarters) || istype(A, /area/mine/north_outpost) || istype(A, /area/mine/west_outpost) || istype(A, /area/wreck) || istype(A, /area/derelict) || istype(A, /area/djstation) || istype(A, /area/syndicate_interception_station))
		new /obj/effect/decal/cleanable/dirt(src)	//vanilla, but it works
		return


	if(prob(80))	//mid dirt  - 1/15
		return

	if(!istype(A, /turf/simulated/floor/open)) // add trash
		if(istype(A,/area/luna/maintenance))
			if(prob(13))
				new trash(src)
	return

	if(istype(A, /area/engine) || istype(A,/area/assembly) || istype(A,/area/luna/maintenance) || istype(A,/area/construction))
	 	//Blood, sweat, and oil.  Oh, and dirt.
//		if(prob(3))
//			new /obj/effect/decal/cleanable/blood/old(src)
//		else
		if(prob(35))
			if(prob(4))
				new /obj/effect/decal/remains/robot/old(src)
			else
				new /obj/effect/decal/cleanable/blood/oil(src)
			new /obj/effect/decal/cleanable/dirt(src)
		return

	if(istype(A, /area/crew_quarters/toilet) || istype(A, /area/crew_quarters/locker/locker_toilet) || istype(A, /area/crew_quarters/bar))
		if(prob(40))
			if(prob(90))
				new /obj/effect/decal/cleanable/vomit/old(src)
//			else
//				new /obj/effect/decal/cleanable/blood/old(src)
		else
			new /obj/effect/decal/cleanable/dirt(src)
		return

	if(istype(A, /area/quartermaster))
		if(prob(75))
			new /obj/effect/decal/cleanable/dirt(src)
		else
			new /obj/effect/decal/cleanable/blood/oil(src)
		return



	if(prob(75))	//low dirt  - 1/60
		return



	if(istype(A, /area/turret_protected) || istype(A, /area/security))	//chance of incident
		if(prob(20))
			if(prob(5))
				new /obj/effect/decal/cleanable/blood/gibs/old(src)
//			else
//				new /obj/effect/decal/cleanable/blood/old(src)
		else
			new /obj/effect/decal/cleanable/dirt(src)
		return


	if(istype(A, /area/crew_quarters/kitchen))	//Kitchen messes
		if(prob(60))
			if(prob(50))
				new /obj/effect/decal/cleanable/egg_smudge(src)
			else
				new /obj/effect/decal/cleanable/flour(src)
		else if(prob(33))
			new /obj/effect/decal/cleanable/dirt(src)
		return

	if(istype(A, /area/medical))	//Kept clean, but chance of blood
		if(prob(66))
			if(prob(5))
				new /obj/effect/decal/cleanable/blood/gibs/old(src)
//			else
//				new /obj/effect/decal/cleanable/blood/old(src)
		else
			if(prob(30))
				if(istype(A, /area/medical/morgue))
					new /obj/item/weapon/ectoplasm(src)
				else
					new /obj/effect/decal/cleanable/vomit/old(src)
		return

	if(istype(A, /area/toxins))
		if(prob(80))
			new /obj/effect/decal/cleanable/dirt(src)
		else
			new /obj/effect/decal/cleanable/greenglow(src)	//this cleans itself up but it might startle you when you see it.
		return

	//default
	new /obj/effect/decal/cleanable/dirt(src)
	return