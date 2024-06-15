//LATHES


/obj/machinery/deathnetlathe
    name = "CS-5 Industry Standard Materializer"
    desc = "Standard issue machinery for the production of useful components. Takes in various materials that may be found in mineral deposits. You're not exactly sure how it works, its quite intricate in its design."
    icon = 'icons/obj/deathnetindustrial.dmi'
    icon_state = "fabricator"
    var/list/components = list(/obj/item/stack/cable_coil, /obj/item/weapon/cell, /obj/item/weapon/stock_parts/capacitor, /obj/item/weapon/stock_parts/manipulator, /obj/item/weapon/stock_parts/matter_bin, /obj/item/weapon/stock_parts/micro_laser, /obj/item/weapon/stock_parts/scanning_module)

/obj/machinery/deathnetlathe/attackby(obj/item/I, mob/user)
    if(istype(I, /obj/item/stack))
        var/obj/item/stack/S = I
        var/obj/item/component_type = pick(components)
        new component_type(loc)
        S.use(1)
        user.visible_message("<span class='notice'>[user] inserts [I] into [src] and it produces a [component_type.name].</span>")

/obj/machinery/deathnetdeconstructor
    name = "XMR-32 Component Annihilator"
    desc = "Machine of most intricate design, vibrating in a most peculiar rhythmic motion. Can be used to deconstruct many industrial components with ease. You aren't sure how it works."
    icon = 'icons/obj/deathnetindustrial.dmi'
    icon_state = "deconstructor"

    var/list/materials = list(/obj/item/stack/sheet/metal, /obj/item/stack/sheet/glass, /obj/item/stack/rods)

/obj/machinery/deathnetdeconstructor/attackby(obj/item/I, mob/user)
    if(istype(I, /obj/item))
        var/obj/item/material_type = pick(materials)
        var/start_icon_state = src.icon_state
        
        src.icon_state = "deconstructor-anim"
        sleep(26)
    
        new material_type(loc)
        qdel(I)
        
        src.icon_state = "deconstructor-deconstructing"
        sleep(20)
        
        src.icon_state = start_icon_state

        user.visible_message("<span class='notice'>[user] inserts [I] into [src] and it produces a [material_type.name].</span>")

/obj/machinery/ore_processor
    name = "TSY-1 Ore Refinery Node"
    desc = "Billowing with smoke and metallic vapours, this piece of machinery aids in refining ore into useful ingots."
    icon = 'icons/obj/deathnetindustrial.dmi'
    icon_state = "ore-processor"

    var/list/ore_processing = list(
        /obj/item/weapon/ore/iron = /obj/item/stack/sheet/metal,
        /obj/item/weapon/ore/glass = /obj/item/stack/sheet/glass,
        /obj/item/weapon/ore/silver = /obj/item/stack/sheet/mineral/silver,
        /obj/item/weapon/ore/gold = /obj/item/stack/sheet/mineral/gold,
        /obj/item/weapon/ore/plasma = /obj/item/stack/sheet/mineral/plasma,
        /obj/item/weapon/ore/diamond = /obj/item/stack/sheet/mineral/diamond,
        /obj/item/weapon/ore/uranium = /obj/item/stack/sheet/mineral/uranium
    )

/obj/machinery/ore_processor/attackby(obj/item/I, mob/user)
    if(istype(I, /obj/item/weapon/ore))
        var/start_icon_state = src.icon_state
        var/material_type = ore_processing[I.type]
        if(material_type)
            new material_type(loc)
            qdel(I)
            user.visible_message("<span class='notice'>[user] inserts [I] into [src] and it produces a [material_type].</span>")
            src.icon_state = "ore-processor-anim"
            sleep(26)
            src.icon_state = start_icon_state

//ITEMS

/obj/item/stack/sheet/scrap
	name = "scrap"
	desc = "Assorted pieces of random metallic objects that could serve useful in the crafting of something."
	singular_name = "piece of scrap"
	icon_state = "scrap"
	max_amount = 5
	throwforce = 14.0

/obj/item/weapon/super_capacitor_complex
    name = "Super-Capacitor Complex"
    desc = "Item of most crude origin, seemingly for use in discharging a large amount of electrical energy in a short amount of time."
    icon = 'icons/obj/deathnetindustrial.dmi'
    icon_state = "cell-capacBBC"

/obj/item/weapon/crude_stabilizing_hull
    name = "Crude Stabilizing Hull"
    desc = "Small item of jury-rigged nature, used to elaborately contain other objects."
    icon = 'icons/obj/deathnetindustrial.dmi'
    icon_state = "bin-manip"

/obj/item/weapon/grenade/matter_equilibrium_effector
    name = "Low-yield Matter-Equilibrium Effector"
    desc = "While the workings of this object are unknown to you, it is seemingly obvious that it is meant to cause explosive damage."
    icon = 'icons/obj/deathnetindustrial.dmi'
    icon_state = "cell-capacBAA"
    item_state = "flashbang"
    det_time = 5

/obj/item/weapon/weak_laser_module
    name = "Weak Laser Module"
    desc = "Module that emits very weak lasers. Shoddily made, could break at any time."
    icon = 'icons/obj/deathnetindustrial.dmi'
    icon_state = "scan-laser"

/obj/item/weapon/wooden_stock
    name = "Wooden Stock"
    desc = "Weapon stock of very imprecise design."
    icon = 'icons/obj/deathnetindustrial.dmi'
    icon_state = "wooden_stock"

/obj/item/weapon/gun/energy/laser/blaster
    name = "Low-Emitting Blaster"
    desc = "Weakly shoots lasers when the trigger is pulled. Due to its extremely crude design, it is unlikely the weapon will do much damage."
    icon = 'icons/obj/deathnetindustrial.dmi'
    icon_state = "blaster"

//RECIPES

/obj/item/weapon/stock_parts/capacitor/attackby(obj/item/I, mob/user)
    if(istype(I, /obj/item/weapon/cell))
        new /obj/item/weapon/super_capacitor_complex(loc)
        qdel(src)
        qdel(I)
        user.visible_message("<span class='notice'>[user] combines [src] and [I] to create a Super-Capacitor Complex.</span>")

/obj/item/weapon/stock_parts/manipulator/attackby(obj/item/I, mob/user)
    if(istype(I, /obj/item/weapon/stock_parts/matter_bin))
        new /obj/item/weapon/crude_stabilizing_hull(loc)
        qdel(src)
        qdel(I)
        user.visible_message("<span class='notice'>[user] combines [src] and [I] to create a Crude Stabilizing Hull.</span>")

/obj/item/weapon/super_capacitor_complex/attackby(obj/item/I, mob/user)
    if(istype(I, /obj/item/weapon/crude_stabilizing_hull))
        new /obj/item/weapon/grenade/matter_equilibrium_effector(loc)
        qdel(src)
        qdel(I)
        user.visible_message("<span class='notice'>[user] combines [src] and [I] to create a Low-yield Matter-Equilibrium Effector.</span>")

/obj/item/weapon/stock_parts/micro_laser/attackby(obj/item/I, mob/user)
    if(istype(I, /obj/item/weapon/stock_parts/scanning_module))
        new /obj/item/weapon/weak_laser_module(loc)
        qdel(src)
        qdel(I)
        user.visible_message("<span class='notice'>[user] combines [src] and [I] to create a Weak Laser Module.</span>")

/obj/item/weapon/stack/sheet/wood/attackby(obj/item/I, mob/user)
    if(istype(I, /obj/item/weapon/wrench))
        new /obj/item/weapon/wooden_stock(loc)
        qdel(src)
        qdel(I)
        user.visible_message("<span class='notice'>[user] uses [I] on [src] to create a Wooden Stock.</span>")

/obj/item/weapon/weak_laser_module/attackby(obj/item/I, mob/user)
    if(istype(I, /obj/item/weapon/super_capacitor_complex))
        var/mob/living/carbon/human/H = user
        if(H.get_inactive_hand())
            var/obj/item/W = H.get_inactive_hand()
            if(istype(W, /obj/item/weapon/wooden_stock))
                new /obj/item/weapon/gun/energy/laser/blaster(loc)
                qdel(src)
                qdel(I)
                qdel(W)
                user.visible_message("<span class='notice'>[user] combines [src], [I], and [W] to create a Low-Emitting Blaster.</span>")
