
/obj/item/clothing/suit/armor
	allowed = list(/obj/item/weapon/gun/energy,/obj/item/weapon/reagent_containers/spray/pepper,/obj/item/weapon/gun/projectile,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/weapon/melee/baton,/obj/item/weapon/handcuffs)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	flags = FPRINT | TABLEPASS
	armor = list(melee = 35, bullet = 20, laser = 50, energy = 10, bomb = 25, bio = 0, rad = 0)
	cold_protection = UPPER_TORSO|LOWER_TORSO
	min_cold_protection_temperature = ARMOR_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = UPPER_TORSO|LOWER_TORSO
	max_heat_protection_temperature = ARMOR_MAX_HEAT_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.6


/obj/item/clothing/suit/armor/vest
	name = "armor"
	desc = "An armored vest that protects against some damage."
	icon_state = "armor"
	item_state = "armor"
	blood_overlay_type = "armor"
	flags = FPRINT | TABLEPASS | ONESIZEFITSALL
	armor = list(melee = 50, bullet = 15, laser = 50, energy = 10, bomb = 25, bio = 0, rad = 0)

/obj/item/clothing/suit/armor/vest/security
	name = "security armor"
	desc = "An armored vest that protects against some damage. This one has NanoTrasen corporate badge."
	icon_state = "armor"
	item_state = "armor"

/obj/item/clothing/suit/armor/vest/warden
	name = "Warden's jacket"
	desc = "An armoured jacket with silver rank pips and livery."
	icon_state = "warden_jacket"
	item_state = "armor"


/obj/item/clothing/suit/armor/riot
	name = "Riot Suit"
	desc = "A suit of armor with heavy padding to protect against melee attacks. Looks like it might impair movement."
	icon_state = "riot"
	item_state = "swat_suit"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	slowdown = 1
	armor = list(melee = 80, bullet = 10, laser = 10, energy = 10, bomb = 0, bio = 0, rad = 0)
	flags_inv = HIDEJUMPSUIT
	siemens_coefficient = 0.5


/obj/item/clothing/suit/armor/bulletproof //I am hard removing this because our mappers are capped at 75 iq
	name = "NEVER SEE THIS"
	desc = "A vest that excels in protecting the wearer against high-velocity solid projectiles."
	icon_state = "a"
	item_state = "a"
	blood_overlay_type = "a"
	armor = list(melee = 10, bullet = 80, laser = 10, energy = 10, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.7

/obj/item/clothing/suit/armor/laserproof
	name = "Ablative Armor Vest"
	desc = "A vest that excels in protecting the wearer against energy projectiles."
	icon_state = "armor_reflec"
	item_state = "armor_reflec"
	blood_overlay_type = "armor"
	armor = list(melee = 10, bullet = 10, laser = 80, energy = 50, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0

/obj/item/clothing/suit/armor/swat
	name = "swat suit"
	desc = "A heavily armored suit that protects against moderate damage. Used in special operations."
	icon_state = "deathsquad"
	item_state = "swat_suit"
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	flags = FPRINT | TABLEPASS
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	allowed = list(/obj/item/weapon/gun,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/weapon/melee/baton,/obj/item/weapon/handcuffs,/obj/item/weapon/tank/emergency_oxygen)
	slowdown = 1
	armor = list(melee = 80, bullet = 60, laser = 50,energy = 25, bomb = 50, bio = 0, rad = 0)
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.5


/obj/item/clothing/suit/armor/swat/officer
	name = "officer jacket"
	desc = "An armored jacket used in special operations."
	icon_state = "detective"
	item_state = "det_suit"
	blood_overlay_type = "coat"
	flags_inv = 0


/obj/item/clothing/suit/armor/det_suit
	name = "armor"
	desc = "An armored vest with a detective's badge on it."
	icon_state = "detective-armor"
	item_state = "armor"
	blood_overlay_type = "armor"
	flags = FPRINT | TABLEPASS | ONESIZEFITSALL
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	armor = list(melee = 50, bullet = 15, laser = 50, energy = 10, bomb = 25, bio = 0, rad = 0)


//Reactive armor
//When the wearer gets hit, this armor will teleport the user a short distance away (to safety or to more danger, no one knows. That's the fun of it!)
/obj/item/clothing/suit/armor/reactive
	name = "Reactive Teleport Armor"
	desc = "Someone seperated our Research Director from his own head!"
	var/active = 0.0
	icon_state = "reactiveoff"
	item_state = "reactiveoff"
	blood_overlay_type = "armor"
	slowdown = 1
	flags = FPRINT | TABLEPASS
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/suit/armor/reactive/IsShield()
	if(active)
		return 1
	return 0

/obj/item/clothing/suit/armor/reactive/attack_self(mob/user as mob)
	src.active = !( src.active )
	if (src.active)
		user << "\blue The reactive armor is now active."
		src.icon_state = "reactive"
		src.item_state = "reactive"
	else
		user << "\blue The reactive armor is now inactive."
		src.icon_state = "reactiveoff"
		src.item_state = "reactiveoff"
		src.add_fingerprint(user)
	return

/obj/item/clothing/suit/armor/reactive/emp_act(severity)
	active = 0
	src.icon_state = "reactiveoff"
	src.item_state = "reactiveoff"
	..()


//All of the armor below is mostly unused


/obj/item/clothing/suit/armor/centcomm
	name = "Cent. Com. armor"
	desc = "A suit that protects against some damage."
	icon_state = "centcom"
	item_state = "centcom"
	w_class = 4//bulky item
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	allowed = list(/obj/item/weapon/gun/energy,/obj/item/weapon/melee/baton,/obj/item/weapon/handcuffs,/obj/item/weapon/tank/emergency_oxygen)
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0

/obj/item/clothing/suit/armor/heavy
	name = "heavy armor"
	desc = "A heavily armored suit that protects against moderate damage."
	icon_state = "heavy"
	item_state = "swat_suit"
	w_class = 4//bulky item
	gas_transfer_coefficient = 0.90
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	slowdown = 3
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	siemens_coefficient = 0

/obj/item/clothing/suit/armor/tdome
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT

/obj/item/clothing/suit/armor/tdome/red
	name = "Thunderdome suit (red)"
	desc = "Reddish armor."
	icon_state = "tdred"
	item_state = "tdred"
	siemens_coefficient = 1

/obj/item/clothing/suit/armor/tdome/green
	name = "Thunderdome suit (green)"
	desc = "Pukish armor."
	icon_state = "tdgreen"
	item_state = "tdgreen"
	siemens_coefficient = 1

/obj/item/clothing/suit/armor/tactical
	name = "tactical armor"
	desc = "A suit of armor most often used by Special Weapons and Tactics squads. Includes padded vest with pockets along with shoulder and kneeguards."
	icon_state = "swatarmor"
	item_state = "armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	slowdown = 1
	armor = list(melee = 60, bullet = 60, laser = 60, energy = 40, bomb = 20, bio = 0, rad = 0)
	siemens_coefficient = 0.7

//New Vests
/obj/item/clothing/suit/storage/vest
	name = "armor vest"
	desc = "A simple kevlar plate carrier."
	icon_state = "kvest"
	item_state = "kvest"
	armor = list(melee = 50, bullet = 20, laser = 50, energy = 10, bomb = 25, bio = 0, rad = 0)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	allowed = list(/obj/item/weapon/gun,/obj/item/weapon/reagent_containers/spray/pepper,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/weapon/melee/baton,/obj/item/weapon/handcuffs)
	var/icon_badge
	var/icon_nobadge
	verb/toggle()
		set name ="Adjust Badge"
		set category = "Object"
		set src in usr
		if(!usr.canmove || usr.stat || usr.restrained())
			return 0

		if(icon_state == icon_badge)
			icon_state = icon_nobadge
			usr << "You unclip the badge from the vest."
		else if(icon_state == icon_nobadge)
			icon_state = icon_badge
			usr << "You clip the badge to the vest."
		else
			usr << "You can't find a badge for [src]."
			return
		update_icon()

/obj/item/clothing/suit/storage/vest/officer
	name = "officer armor vest"
	desc = "A simple kevlar plate carrier belonging to Nanotrasen. This one has a security holobadge clipped to the chest."
	icon_state = "officervest_nobadge"
	item_state = "officervest_nobadge"
	icon_badge = "officervest_badge"
	icon_nobadge = "officervest_nobadge"

/obj/item/clothing/suit/storage/vest/warden
	name = "warden armor vest"
	desc = "A simple kevlar plate carrier belonging to Nanotrasen. This one has a silver badge clipped to the chest."
	icon_state = "wardenvest_nobadge"
	item_state = "wardenvest_nobadge"
	icon_badge = "wardenvest_badge"
	icon_nobadge = "wardenvest_nobadge"
	armor = list(melee = 50, bullet = 30, laser = 50, energy = 10, bomb = 25, bio = 0, rad = 0)

/obj/item/clothing/suit/storage/vest/hos
	name = "commander armor vest"
	desc = "A simple kevlar plate carrier belonging to Nanotrasen. This one has a gold badge clipped to the chest."
	icon_state = "hosvest_nobadge"
	item_state = "hosvest_nobadge"
	icon_badge = "hosvest_badge"
	icon_nobadge = "hosvest_nobadge"
	armor = list(melee = 60, bullet = 45, laser = 50, energy = 10, bomb = 25, bio = 0, rad = 0)

/obj/item/clothing/suit/storage/vest/pcrc
	name = "PCRC armor vest"
	desc = "A simple kevlar plate carrier belonging to Proxima Centauri Risk Control. This one has a PCRC crest clipped to the chest."
	icon_state = "pcrcvest_nobadge"
	item_state = "pcrcvest_nobadge"
	icon_badge = "pcrcvest_badge"
	icon_nobadge = "pcrcvest_nobadge"

/obj/item/clothing/suit/storage/vest/detective
	name = "detective armor vest"
	desc = "A simple kevlar plate carrier in a vintage brown, it has a badge clipped to the chest that reads, 'Private investigator'."
	icon_state = "detectivevest_nobadge"
	item_state = "detectivevest_nobadge"
	icon_badge = "detectivevest_badge"
	icon_nobadge = "detectivevest_nobadge"
	armor = list(melee = 50, bullet = 20, laser = 50, energy = 10, bomb = 25, bio = 0, rad = 0)

/obj/item/clothing/suit/storage/vest/heavy
	name = "heavy armor vest"
	desc = "A heavy kevlar plate carrier with webbing attached."
	icon_state = "webvest"
	item_state = "webvest"
	armor = list(melee = 50, bullet = 40, laser = 50, energy = 25, bomb = 30, bio = 0, rad = 0)
	slowdown = 1
	storage_slots = 4

/obj/item/clothing/suit/storage/vest/heavy/officer
	name = "officer heavy armor vest"
	desc = "A heavy kevlar plate carrier belonging to Nanotrasen with webbing attached. This one has a security holobadge clipped to the chest."
	icon_state = "officerwebvest_nobadge"
	item_state = "officerwebvest_nobadge"
	icon_badge = "officerwebvest_badge"
	icon_nobadge = "officerwebvest_nobadge"

/obj/item/clothing/suit/storage/vest/heavy/warden
	name = "warden heavy armor vest"
	desc = "A heavy kevlar plate carrier belonging to Nanotrasen with webbing attached. This one has a silver badge clipped to the chest."
	icon_state = "wardenwebvest_nobadge"
	item_state = "wardenwebvest_nobadge"
	icon_badge = "wardenwebvest_badge"
	icon_nobadge = "wardenwebvest_nobadge"

/obj/item/clothing/suit/storage/vest/heavy/hos
	name = "commander heavy armor vest"
	desc = "A heavy kevlar plate carrier belonging to Nanotrasen with webbing attached. This one has a gold badge clipped to the chest."
	icon_state = "hoswebvest_nobadge"
	item_state = "hoswebvest_nobadge"
	icon_badge = "hoswebvest_badge"
	icon_nobadge = "hoswebvest_nobadge"

/obj/item/clothing/suit/storage/vest/heavy/pcrc
	name = "PCRC heavy armor vest"
	desc = "A heavy kevlar plate carrier belonging to Proxima Centauri Risk Control with webbing attached. This one has a PCRC crest clipped to the chest."
	icon_state = "pcrcwebvest_nobadge"
	item_state = "pcrcwebvest_nobadge"
	icon_badge = "pcrcwebvest_badge"
	icon_nobadge = "pcrcwebvest_nobadge"

/obj/item/clothing/suit/storage/vest/heavy/merc
	name = "heavy armor vest"
	desc = "A high-quality heavy kevlar plate carrier in a fetching tan. The vest is surprisingly flexible, and possibly made of an advanced material."
	icon_state = "mercwebvest"
	item_state = "mercwebvest"
	armor = list(melee = 65, bullet = 60, laser = 65, energy = 45, bomb = 50, bio = 0, rad = 0)
	slowdown = 0