var/list/name_to_mineral

proc/SetupMinerals()
	name_to_mineral = list()
	for(var/type in typesof(/mineral) - /mineral)
		var/mineral/new_mineral = new type
		if(!new_mineral.name)
			continue
		name_to_mineral[new_mineral.name] = new_mineral
	return 1

mineral
	///What am I called?
	var/name
	var/display_name
	///How much ore?
	var/result_amount
	///Does this type of deposit spread?
	var/spread = 1
	///Chance of spreading in any direction
	var/spread_chance

	///Path to the resultant ore.
	var/ore

	New()
		. = ..()
		if(!display_name)
			display_name = name

mineral/uranium
	name = "Uranium"
	result_amount = 5
	spread_chance = 0
	ore = /obj/item/weapon/ore/uranium

mineral/iron
	name = "Iron"
	result_amount = 5
	spread_chance = 0
	ore = /obj/item/weapon/ore/iron

mineral/diamond
	name = "Diamond"
	result_amount = 5
	spread_chance = 0
	ore = /obj/item/weapon/ore/diamond

mineral/gold
	name = "Gold"
	result_amount = 5
	spread_chance = 0
	ore = /obj/item/weapon/ore/gold

mineral/silver
	name = "Silver"
	result_amount = 5
	spread_chance = 0
	ore = /obj/item/weapon/ore/silver

mineral/plasma
	name = "Plasma"
	result_amount = 5
	spread_chance = 0
	ore = /obj/item/weapon/ore/plasma

mineral/clown
	display_name = "Bananium"
	name = "Clown"
	result_amount = 3
	spread = 0
	ore = /obj/item/weapon/ore/clown

/obj/item/weapon/ore/slag
	name = "Slag"
	desc = "Completely useless"
	icon_state = "slag"

//DEATHNET MINERALS - ARBITRATIONS FOR WALLS
//ADD AS MANY AS YOU WANT, WHO CARES MAN

mineral/concrete
	display_name = "Never see this"
	name = "Concrete"
	result_amount = 1
	spread = 1
	ore = /obj/item/weapon/ore/concrete

mineral/kilotrium
	display_name = "Never see this"
	name = "kilotrium"
	result_amount = 1
	spread = 1
	ore = /obj/item/weapon/ore/kilotrium

mineral/megatrium
	display_name = "Never see this"
	name = "Megatrium"
	result_amount = 1
	spread = 1
	ore = /obj/item/weapon/ore/megatrium

mineral/gigatrium
	display_name = "Never see this"
	name = "Gigatrium"
	result_amount = 1
	spread = 1
	ore = /obj/item/weapon/ore/gigatrium

mineral/teratrium
	display_name = "Never see this"
	name = "Teratrium"
	result_amount = 1
	spread = 1
	ore = /obj/item/weapon/ore/teratrium

mineral/petatrium
	display_name = "Never see this"
	name = "Petatrium"
	result_amount = 1
	spread = 1
	ore = /obj/item/weapon/ore/petatrium
	
mineral/exatrium
	display_name = "Never see this"
	name = "exatrium"
	result_amount = 1
	spread = 1
	ore = /obj/item/weapon/ore/exatrium
	
mineral/hell
	display_name = "Never see this"
	name = "hell"
	result_amount = 1
	spread = 1
	ore = /obj/item/weapon/ore/hell

mineral/woodium
	display_name = "Never see this"
	name = "woodium"
	result_amount = 1
	spread = 1
	ore = /obj/item/weapon/ore/woodium

mineral/officium
	display_name = "Never see this"
	name = "officium"
	result_amount = 1
	spread = 1
	ore = /obj/item/weapon/ore/officium