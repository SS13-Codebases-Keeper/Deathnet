/datum/job/ltnt
	title = "Lieutenant"
	flag = LTNT
	department_head = list("Minister")
	department_flag = CITIZEN
	faction = "Deathnet"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Minister"
	description = "You're the local top gun. But your whores don't like being called whores. Handle it, Lieutenant!"
	selection_color = "#50196f"
	idtype = /obj/item/weapon/card/id/specialist
	access = list(access_civilized, access_ltnt)
	minimal_access = list(access_civilized, access_ltnt)

	equip(var/mob/living/carbon/human/H)
		if(!H)
			return 0
		..()
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/centcom(H), slot_shoes)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/ltnt(H), slot_w_uniform)

/datum/job/amuser
	title = "Hostess"
	flag = AMUSER
	department_head = list("Minister")
	department_flag = CITIZEN
	faction = "Deathnet"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Lieutenant"
	description = "Another night under the dry spell, another night without rontz. But you will change that. Lure them into your lair and suck the mammon out of them, one way or other. The reality of the situation is, there's no length one won't go for an ounce of stimulation in these trying times. Remember: hands off if there is no extra pay, never reveal your real age."
	selection_color = "#6d3190"
	idtype = /obj/item/weapon/card/id/citizen
	access = list(access_civilized, access_ltnt)
	minimal_access = list(access_civilized, access_ltnt)

	equip(var/mob/living/carbon/human/H)
		if(!H)
			return 0
		..()
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/amuser(H), slot_shoes)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/amuser(H), slot_w_uniform)

/datum/job/candyman
	title = "Candyman"
	flag = CANDYMAN
	department_head = list("Your Desires")
	department_flag = CITIZEN
	faction = "Deathnet"
	total_positions = 1
	spawn_positions = 1
	supervisors = "your Desires"
	description = "Arm everyone who is not already armed."
	selection_color = "#6d3190"
	idtype = /obj/item/weapon/card/id/specialist
	access = list(access_civilized, access_candyman)
	minimal_access = list(access_civilized, access_candyman)


	equip(var/mob/living/carbon/human/H)
		if(!H)
			return 0
		..()
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/candyman(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/head/candyman(H), slot_head)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/centcom(H), slot_shoes)

/datum/job/advocate
	title = "Advocate"
	flag = ADVOCATE
	department_head = list("Minister")
	department_flag = CITIZEN
	faction = "Deathnet"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Minister"
	description = "What in the Dict-Tyrant's name are they doing in this lay-back shit-fuck town? It's all out of order! So much blood, so much suffering  ... So many CLERICAL ERRORS! It's your job to fight back against this ... with Words."
	selection_color = "#576E84"
	idtype = /obj/item/weapon/card/id/citizen
	access = list(access_civilized)
	minimal_access = list(access_civilized)

	equip(var/mob/living/carbon/human/H)
		if(!H)
			return 0
		..()
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/advocate(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/centcom(H), slot_shoes)

/datum/job/practitioner
	title = "Practitioner"
	flag = PRACTITIONER
	department_head = list("Minister")
	department_flag = CITIZEN
	faction = "Deathnet"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Minister"
	description = "Nothing like a degree in Quantum Medical Practice that makes a man want to retreat into the mask."
	selection_color = "#576E84"
	idtype = /obj/item/weapon/card/id/specialist
	access = list(access_civilized, access_clinic)
	minimal_access = list(access_civilized, access_clinic)

	equip(var/mob/living/carbon/human/H)
		if(!H)
			return 0
		..()
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/practitioner(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/centcom(H), slot_shoes)
		H.equip_to_slot_or_del(new /obj/item/clothing/mask/practitioner(H), slot_wear_mask)
		H.equip_to_slot_or_del(new /obj/item/clothing/gloves/suit(H), slot_gloves)

/datum/job/liaison
	title = "Commercial Liaison"
	flag = LIAISON
	department_head = list("Minister")
	department_flag = CITIZEN
	faction = "Deathnet"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Minister"
	description = "You're a uniquely unlucky guy. You worked so hard to get here, and what've you got to show for it? Might as well sell a few baubles to these losers."
	selection_color = "#576E84"
	idtype = /obj/item/weapon/card/id/citizen
	access = list(access_civilized)
	minimal_access = list(access_civilized)

	equip(var/mob/living/carbon/human/H)
		if(!H)
			return 0
		..()
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/liaison(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/centcom(H), slot_shoes)
		H.equip_to_slot_or_del(new /obj/item/clothing/suit/liaison(H), slot_wear_suit)
		H.equip_to_slot_or_del(new /obj/item/clothing/glasses/liaison(H), slot_glasses)

/datum/job/worker
	title = "Worker"
	flag = WORKER
	department_head = list("Minister")
	department_flag = CITIZEN
	faction = "Deathnet"
	total_positions = 54
	spawn_positions = 15
	supervisors = "unknown, for now"
	description = "You're a piece of shit with nothing to your name. Nobody loves you and you're going to die alone. Might as well do something crazy."
	selection_color = "#576E84"
	idtype = /obj/item/weapon/card/id/citizen
	access = list(access_none)
	minimal_access = list(access_none)

	equip(var/mob/living/carbon/human/H)
		if(!H)
			return 0
		..()
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/worker(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/worker(H), slot_shoes)
		return 1



/datum/job/psyker
	title = "Psyker"
	flag = PSYKER
	department_head = list("Truth")
	department_flag = CITIZEN
	faction = "Deathnet"
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Truth"
	description = "Hey, did you know? They're coming for you. Start running."
	selection_color = "#576E84"
	idtype = /obj/item/weapon/card/id/horror
	access = list(access_none)
	minimal_access = list(access_none)

	equip(var/mob/living/carbon/human/H)
		if(!H)
			return 0
		..()
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/psyker(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/psyker(H), slot_head)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/worker(H), slot_shoes)
		H.spell_list += new /obj/effect/proc_holder/spell/targeted/smoke
		H.spell_list += new /obj/effect/proc_holder/spell/targeted/trigger/blind


/datum/job/gazer
	title = "Gazer"
	flag = GAZER
	department_head = list("NO ONE")
	department_flag = CITIZEN
	faction = "Deathnet"
	total_positions = 1
	spawn_positions = 1
	supervisors = "NO ONE."
	description = "The people shall know the truth."
	selection_color = "#785D6A"
	idtype = /obj/item/weapon/card/id/horror
	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()


	equip(var/mob/living/carbon/human/H)
		if(!H)
			return 0
		..()
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/gazer(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/mask/gazer(H), slot_wear_mask)
		H.spell_list += new /obj/effect/proc_holder/spell/targeted/smoke
		H.spell_list += new /obj/effect/proc_holder/spell/targeted/trigger/blind
		H.spell_list += new /obj/effect/proc_holder/spell/targeted/inflict_handler/disintegrate
		H.spell_list += new /obj/effect/proc_holder/spell/targeted/turf_teleport/blink
		//H.spell_list += new /obj/effect/proc_holder/spell/targeted/explosion - what were they thinking
		H.spell_list += new /obj/effect/proc_holder/spell/targeted/mind_transfer
		H.spell_list += new /obj/effect/proc_holder/spell/targeted/ethereal_jaunt

	get_access()
		return get_all_accesses()

