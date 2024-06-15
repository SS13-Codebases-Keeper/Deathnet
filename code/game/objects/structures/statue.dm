/obj/structure/statue/
	name = "Base statue - Never see this."
	icon = 'icons/obj/64x64.dmi'
	anchored = 1
	density = 1
	layer = 4 //Above most
	pixel_x = -16 //Perfectly centers the sprite
	//pixel_y = -32 Unneeded


/obj/structure/statue/carcosa
	name = "statue"
	desc = "A statue of some ominous looking, robed, figure. There's barely a scratch on it."
	icon_state = "carcosa"

/obj/structure/statue/carcosa/broken
	name = "broken statue"
	desc = "A statue of some ominous looking, robed, figure. It's badly damaged."
	icon_state = "carcosa_broken"

/obj/structure/statue/streetlamp
	name = "street lamp"
	desc = "A solid street lamp."
	icon_state = "lamp"

/obj/structure/statue/streetlamp/lit
	name = "street lamp"
	desc = "A solid street lamp."
	icon_state = "lamp_lit"

/obj/structure/statue/streetlamp/lit/New()
	src.SetLuminosity(4, 4, 4)
	..()

/obj/structure/statue/barrels
	name = "barrels"
	desc = "A bunch of barrels."
	icon_state = "barrel-bunch"

/obj/structure/statue/barrels
	name = "barrels"
	desc = "A bunch of barrels."
	icon_state = "barrel"

/obj/structure/statue/canisters
	name = "canisters"
	desc = "A bunch of canisters."
	icon_state = "random_canistersa"

/obj/structure/statue/canistersb
	name = "canisters"
	desc = "A bunch of canisters."
	icon_state = "random_canistersb"