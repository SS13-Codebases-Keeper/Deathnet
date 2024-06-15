/datum/job/minister
	title = "Minister"
	flag = MINISTER
	department_head = list("Your Will")          ///NEVER EVER USE r_SLOT IT'S THE PASSPORT SLOT
	department_flag = AUTH
	faction = "Deathnet"
	total_positions = 1
	spawn_positions = 1
	supervisors = "whatever the voices tell you"
	description = "What a disgusting, vermin-like horde it is you oversee. It's every night with the orders you slave over giving. As long as production doesn't stop, and not too many people die -- you'll be fine, and won't have to answer to The Capital."
	selection_color = "#040046"
	idtype = /obj/item/weapon/card/id/mastermind
	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()
	powers = list("commune")
	equip(var/mob/living/carbon/human/H)
		if(!H)
			return 0
		..()
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/minister, slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)

		world << "<b>[H.real_name] is the Minister!</b>"
		return 1

	get_access()
		return get_all_accesses()

/datum/job/advisor
	title = "Advisor"
	flag = ADVISOR
	department_head = list("Minister")
	department_flag = AUTH
	faction = "Deathnet"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Minister"
	description = "Help the Minister."
	selection_color = "#3c397b"
	idtype = /obj/item/weapon/card/id/mastermind
	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()

	equip(var/mob/living/carbon/human/H)
		if(!H)
			return 0
		..()
		
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/advisor(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)

	get_access()
		return get_all_accesses()

/datum/job/informant
	title = "Informant"
	flag = INFORMANT
	department_head = list("Authority Chief")
	department_flag = AUTH
	faction = "Deathnet"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Authority Chief and the Minister"
	description = "Confess everyones sin to the Authority."
	selection_color = "#3c397b"
	idtype = /obj/item/weapon/card/id/enforcer
	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()

	equip(var/mob/living/carbon/human/H)
		if(!H)
			return 0
		..()
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/informant(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest/informant(H), slot_wear_suit)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)
		H.equip_to_slot_or_del(new /obj/item/clothing/gloves/black(H), slot_gloves)
		H.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses(H), slot_glasses)

	get_access()
		return get_all_accesses()

/datum/job/authchf
	title = "Authority Chief"
	flag = AUTHCHF
	department_head = list("Minister")
	department_flag = AUTH
	faction = "Deathnet"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Noumenic Will and the Minister"
	description = "You will make them know."
	selection_color = "#722a38"
	idtype = /obj/item/weapon/card/id/enforcer
	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()

	equip(var/mob/living/carbon/human/H)
		if(!H)
			return 0
		..()
		H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/authchf(H), slot_head)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/authchf(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest/authchf(H), slot_wear_suit)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)

	get_access()
		return get_all_accesses()

/datum/job/authman
	title = "Authorityman"
	flag = AUTHMAN
	department_head = list("Authority Chief")
	department_flag = AUTH
	faction = "Deathnet"
	total_positions = 5
	spawn_positions = 5
	supervisors = "the Authority Chief and the Minister"
	description = "Order. Duty. Loyalty. Those words don't mean much to you, considering you're just a mean mother fucker with a gun on your waist."
	selection_color = "#955864"
	idtype = /obj/item/weapon/card/id/enforcer
	access = list(access_civilized, access_civsec)
	minimal_access = list(access_civilized, access_civsec)

	equip(var/mob/living/carbon/human/H)
		if(!H)
			return 0
		..()
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/authman(H), slot_shoes)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/authman(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/gloves/authman(H), slot_gloves)
		H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/authman(H), slot_head)
		H.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest/authman(H), slot_wear_suit)

/datum/job/watchman
	title = "Watchman"
	flag = WATCHMAN
	department_head = list("Authority Chief")
	department_flag = AUTH
	faction = "Deathnet"
	total_positions = 6
	spawn_positions = 6
	supervisors = "the Authority Chief and the Minister"
	description = "People in the nicer part of town depend on you to keep those dirty, filthy moldmen out and in their little shithole. It's time for some moral rot."
	selection_color = "#955864"
	idtype = /obj/item/weapon/card/id/enforcer
	access = list(access_civilized, access_civsec)
	minimal_access = list(access_civilized, access_civsec)

	equip(var/mob/living/carbon/human/H)
		if(!H)
			return 0
		..()
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/watchman(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)
		H.equip_to_slot_or_del(new /obj/item/clothing/gloves/watchman(H), slot_gloves)
		H.equip_to_slot_or_del(new /obj/item/clothing/head/watchman(H), slot_head)

/datum/job/maintchf
	title = "Maintenance Chief"
	flag = MAINTCHF
	department_head = list("Minister")
	department_flag = AUTH
	faction = "Deathnet"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Engine and the Minister"
	description = "Make sure the ol' reliable is running."
	selection_color = "#581d08"
	idtype = /obj/item/weapon/card/id/specialist
	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()

	equip(var/mob/living/carbon/human/H)
		if(!H)
			return 0
		..()
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/maintainer(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/maintainer(H), slot_shoes)
		H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/maintainer(H), slot_head)
		H.equip_to_slot_or_del(new /obj/item/clothing/gloves/maintainer(H), slot_gloves)
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/utility/full(H), slot_belt)

	get_access()
		return get_all_accesses()


/datum/job/maintainer
	title = "Maintainer"
	flag = MAINTAINER
	department_head = list("Maintenance Chief")
	department_flag = AUTH
	faction = "Deathnet"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Chief Maintainer"
	description = "Help the Chief Maintainer and keep the engine operational."
	selection_color = "#6a4335"
	idtype = /obj/item/weapon/card/id/specialist
	access = list(access_civilized, access_storage, access_reactor)
	minimal_access = list(access_civilized, access_storage, access_reactor)

	equip(var/mob/living/carbon/human/H)
		if(!H)
			return 0
		..()
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/maintainer(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/maintainer(H), slot_shoes)
		H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/maintainer(H), slot_head)
		H.equip_to_slot_or_del(new /obj/item/clothing/gloves/maintainer(H), slot_gloves)
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/utility/full(H), slot_belt)


/datum/job/maintapp
	title = "Operational Apprentice"
	flag = MAINTAPP
	department_head = list("Maintenance Chief")
	department_flag = AUTH
	faction = "Deathnet"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Chief Maintainer"
	description = "Better listen to the Maintainers if you want to get a career. How do you even work half this shit, anyways?"
	selection_color = "#6a4335"
	idtype = /obj/item/weapon/card/id/specialist
	access = list(access_civilized, access_storage, access_reactor)
	minimal_access = list(access_civilized, access_storage, access_reactor)

	equip(var/mob/living/carbon/human/H)
		if(!H)
			return 0
		..()
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/maintapp(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/maintapp(H), slot_shoes)
		H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/maintapp(H), slot_head)
		H.equip_to_slot_or_del(new /obj/item/clothing/gloves/maintapp(H), slot_gloves)
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/utility/full(H), slot_belt)

