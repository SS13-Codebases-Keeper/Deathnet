/obj/structure/sign
	icon = 'icons/obj/decals.dmi'
	anchored = 1
	opacity = 0
	density = 0
	layer = 3.5

/obj/structure/sign/ex_act(severity)
	switch(severity)
		if(1.0)
			qdel(src)
			return
		if(2.0)
			qdel(src)
			return
		if(3.0)
			qdel(src)
			return
		else
	return

/obj/structure/sign/blob_act()
	qdel(src)
	return

/obj/structure/sign/attackby(obj/item/tool as obj, mob/user as mob)	//deconstruction
	if(istype(tool, /obj/item/weapon/screwdriver) && !istype(src, /obj/structure/sign/double))
		user << "You unfasten the sign with your [tool]."
		var/obj/item/sign/S = new(src.loc)
		S.name = name
		S.desc = desc
		S.icon_state = icon_state
		//var/icon/I = icon('icons/obj/decals.dmi', icon_state)
		//S.icon = I.Scale(24, 24)
		S.sign_state = icon_state
		del(src)
	else ..()

/obj/item/sign
	name = "sign"
	desc = ""
	icon = 'icons/obj/decals.dmi'
	w_class = 3		//big
	var/sign_state = ""

/obj/item/sign/attackby(obj/item/tool as obj, mob/user as mob)	//construction
	if(istype(tool, /obj/item/weapon/screwdriver) && isturf(user.loc))
		var/direction = input("In which direction?", "Select direction.") in list("North", "East", "South", "West", "Cancel")
		if(direction == "Cancel") return
		var/obj/structure/sign/S = new(user.loc)
		switch(direction)
			if("North")
				S.pixel_y = 32
			if("East")
				S.pixel_x = 32
			if("South")
				S.pixel_y = -32
			if("West")
				S.pixel_x = -32
			else return
		S.name = name
		S.desc = desc
		S.icon_state = sign_state
		user << "You fasten \the [S] with your [tool]."
		del(src)
	else ..()

/obj/structure/sign/double/map
	name = "station map"
	desc = "A framed picture of the station."

/obj/structure/sign/double/map/left
	icon_state = "map-left"

/obj/structure/sign/double/map/right
	icon_state = "map-right"

/obj/structure/sign/securearea
	name = "\improper SECURE AREA"
	desc = "A warning sign which reads 'SECURE AREA'."
	icon_state = "securearea"

/obj/structure/sign/supersecurearea
	name = "\improper VERY SECURE AREA"
	desc = "A warning sign which reads 'VERY SECURE AREA'. Must be secure."
	icon_state = "supersecurearea"

/obj/structure/sign/biohazard
	name = "\improper BIOHAZARD"
	desc = "A warning sign which reads 'BIOHAZARD'"
	icon_state = "bio"

/obj/structure/sign/electricshock
	name = "\improper HIGH VOLTAGE"
	desc = "A warning sign which reads 'HIGH VOLTAGE'"
	icon_state = "shock"

/obj/structure/sign/examroom
	name = "\improper EXAM"
	desc = "A guidance sign which reads 'EXAM ROOM'"
	icon_state = "examroom"

/obj/structure/sign/vacuum
	name = "\improper HARD VACUUM AHEAD"
	desc = "A warning sign which reads 'HARD VACUUM AHEAD'"
	icon_state = "space"

/obj/structure/sign/deathsposal
	name = "\improper DISPOSAL LEADS TO SPACE"
	desc = "A warning sign which reads 'DISPOSAL LEADS TO SPACE'"
	icon_state = "deathsposal"

/obj/structure/sign/pods
	name = "\improper ESCAPE PODS"
	desc = "A warning sign which reads 'ESCAPE PODS'"
	icon_state = "pods"

/obj/structure/sign/fire
	name = "\improper DANGER: FIRE"
	desc = "A warning sign which reads 'DANGER: FIRE'"
	icon_state = "fire"

/obj/structure/sign/nosmoking_1
	name = "\improper NO SMOKING"
	desc = "A warning sign which reads 'NO SMOKING'"
	icon_state = "nosmoking"

/obj/structure/sign/nosmoking_2
	name = "\improper NO SMOKING"
	desc = "A warning sign which reads 'NO SMOKING'"
	icon_state = "nosmoking2"

/obj/structure/sign/redcross
	name = "medbay"
	desc = "Home to the trustworthy Practicioners. You wonder what relevance this symbol even has, anyways."
	icon_state = "redcross"

/obj/structure/sign/greencross
	name = "medbay"
	desc = "Home to the trustworthy Practicioners. You wonder what relevance this symbol even has, anyways."
	icon_state = "greencross"

/obj/structure/sign/goldenplaque
	name = "The Most Robust Men Award for Robustness"
	desc = "To be Robust is not an action or a way of life, but a mental state. Only those with the force of Will strong enough to act during a crisis, saving friend from foe, are truly Robust. Stay Robust my friends."
	icon_state = "goldenplaque"

/obj/structure/sign/kiddieplaque
	name = "AI developers plaque"
	desc = "Next to the extremely long list of names and job titles, there is a drawing of a little child. The child appears to be an idiot. Beneath the image, someone has scratched the word \"PACKETS\""
	icon_state = "kiddieplaque"

/obj/structure/sign/atmosplaque
	name = "\improper FEA Atmospherics Division plaque"
	desc = "This plaque commemorates the fall of the Atmos FEA division. For all the charred, dizzy, and brittle men who have died in its hands."
	icon_state = "atmosplaque"

/obj/structure/sign/double/maltesefalcon	//The sign is 64x32, so it needs two tiles. ;3
	name = "The Maltese Falcon"
	desc = "The Maltese Falcon, Space Bar and Grill."

/obj/structure/sign/double/maltesefalcon/left
	icon_state = "maltesefalcon-left"

/obj/structure/sign/double/maltesefalcon/right
	icon_state = "maltesefalcon-right"

/obj/structure/sign/science			//These 3 have multiple types, just var-edit the icon_state to whatever one you want on the map
	name = "\improper SCIENCE!"
	desc = "A warning sign which reads 'SCIENCE!'"
	icon_state = "science1"

/obj/structure/sign/chemistry
	name = "\improper CHEMISTRY"
	desc = "A warning sign which reads 'CHEMISTRY'"
	icon_state = "chemistry1"

/obj/structure/sign/botany
	name = "\improper HYDROPONICS"
	desc = "A warning sign which reads 'HYDROPONICS'"
	icon_state = "hydro1"

/obj/structure/sign/directions/science
	name = "\improper Science department"
	desc = "A direction sign, pointing out which way Science department is."
	icon_state = "direction_sci"

/obj/structure/sign/directions/engineering
	name = "\improper Engineering department"
	desc = "A direction sign, pointing out which way Engineering department is."
	icon_state = "direction_eng"

/obj/structure/sign/directions/security
	name = "\improper Security department"
	desc = "A direction sign, pointing out which way Security department is."
	icon_state = "direction_sec"

/obj/structure/sign/directions/medical
	name = "\improper Medical Bay"
	desc = "A direction sign, pointing out which way Meducal Bay is."
	icon_state = "direction_med"

/obj/structure/sign/directions/evac
	name = "\improper Escape Arm"
	desc = "A direction sign, pointing out which way escape pods are."
	icon_state = "direction_evac"


//New Signs

/obj/structure/sign/deck1
	desc = "A silver sign which reads 'DECK I'."
	name = "DECK I"
	icon_state = "deck1"

/obj/structure/sign/deck2
	desc = "A silver sign which reads 'DECK II'."
	name = "DECK II"
	icon_state = "deck2"

/obj/structure/sign/deck3
	desc = "A silver sign which reads 'DECK III'."
	name = "DECK III"
	icon_state = "deck3"

/obj/structure/sign/deck4
	desc = "A silver sign which reads 'DECK IV'."
	name = "DECK IV"
	icon_state = "deck4"

/obj/structure/sign/nanotrasen
	name = "\improper NanoTrasen"
	desc = "An old metal sign which reads 'NanoTrasen'."
	icon_state = "NT"

/obj/structure/sign/signnew/biohazard
	name = "BIOLOGICAL HAZARD"
	desc = "Warning: Biological and-or toxic hazards present in this area!"
	icon_state = "biohazard"

/obj/structure/sign/signnew/corrosives
	name = "CORROSIVE SUBSTANCES"
	desc = "Warning: Corrosive substances prezent in this area!"
	icon_state = "corrosives"

/obj/structure/sign/signnew/explosives
	name = "EXPLOSIVE SUBSTANCES"
	desc = "Warning: Explosive substances present in this area!"
	icon_state = "explosives"

/obj/structure/sign/signnew/flammables
	name = "FLAMMABLE SUBSTANCES"
	desc = "Warning: Flammable substances present in this area!"
	icon_state = "flammable"

/obj/structure/sign/signnew/laserhazard
	name = "LASER HAZARD"
	desc = "Warning: High powered laser emitters operating in this area!"
	icon_state = "laser"

/obj/structure/sign/signnew/danger
	name = "DANGEROUS AREA"
	desc = "Warning: Generally hazardous area! Exercise caution."
	icon_state = "danger"

/obj/structure/sign/signnew/magnetics
	name = "MAGNETIC FIELD HAZARD"
	desc = "Warning: Extremely powerful magnetic fields present in this area!"
	icon_state = "magnetics"

/obj/structure/sign/signnew/opticals
	name = "OPTICAL HAZARD"
	desc = "Warning: Optical hazards present in this area!"
	icon_state = "optical"

/obj/structure/sign/signnew/radiation
	name = "RADIATION HAZARD"
	desc = "Warning: Significant levels of radiation present in this area!"
	icon_state = "radiation"

/obj/structure/sign/signnew/secure
	name = "SECURE AREA"
	desc = "Warning: Secure Area! Do not enter without authorization!"
	icon_state = "secure"

/obj/structure/sign/signnew/electrical
	name = "ELECTRICAL HAZARD"
	desc = "Warning: Electrical hazards! Wear protective equipment."
	icon_state = "electrical"

/obj/structure/sign/signnew/cryogenics
	name = "CRYOGENIC TEMPERATURES"
	desc = "Warning: Extremely low temperatures in this area."
	icon_state = "cryogenics"

/obj/structure/sign/signnew/canisters
	name = "PRESSURIZED CANISTERS"
	desc = "Warning: Highly pressurized canister storage."
	icon_state = "canisters"

/obj/structure/sign/signnew/oxidants
	name = "OXIDIZING AGENTS"
	desc = "Warning: Oxidizing agents in this area, do not start fires!"
	icon_state = "oxidants"

/obj/structure/sign/signnew/memetic
	name = "MEMETIC HAZARD"
	desc = "Warning: Memetic hazard, wear meson goggles!"
	icon_state = "memetic"

//DEATHNET POSTERS


/obj/structure/sign/deathnet
	icon = 'icons/obj/decalposters.dmi'

/obj/structure/sign/deathnet/dn1
	icon_state="dnposter1"
	name = "The Dark Star"
	desc = "May it guard over us."

/obj/structure/sign/deathnet/dn2
	icon_state="dnposter2"
	name = "The Authority"
	desc = "Courage, duty, honour."

/obj/structure/sign/deathnet/dn3
	icon_state="dnposter3"
	name = "Join Us"
	desc = "We need you in our ranks."

/obj/structure/sign/deathnet/dn4
	icon_state="dnposter4"
	name = "Abstract"
	desc = "A reproduction of a famous painting. What does this shit even mean?"

/obj/structure/sign/deathnet/dn5
	icon_state="dnposter5"
	name = "Skull Banner"
	desc = "Someone dangerous must be around."

/obj/structure/sign/deathnet/dnscreendarkstar
	icon_state="dnscreendarkstar"
	name = "The Dark Star"
	desc = "May it save us."

/obj/structure/sign/deathnet/dnscreendanger
	icon_state="dnscreendanger"
	name = "DANGER - HAZARD"
	desc = "Watch out!"

/obj/structure/sign/deathnet/dnscreenbroken
	icon_state="dnscreenbroken"
	name = "broken screen"
	desc = "Shit. Looks busted."

/obj/structure/sign/deathnet/num1
	icon_state="num1"
	name = "One"
	desc = "One."

/obj/structure/sign/deathnet/num2
	icon_state="num2"
	name = "Two"
	desc = "Two."

/obj/structure/sign/deathnet/num3
	icon_state="num3"
	name = "Three"
	desc = "Three."

/obj/structure/sign/deathnet/num4
	icon_state="num4"
	name = "Four"
	desc = "Four."

/obj/structure/sign/deathnet/num5
	icon_state="num5"
	name = "Five"
	desc = "Five."

/obj/structure/sign/deathnet/num6
	icon_state="num6"
	name = "Six"
	desc = "Six."

/obj/structure/sign/deathnet/num7
	icon_state="num7"
	name = "Seven"
	desc = "Seven."

/obj/structure/sign/deathnet/num8
	icon_state="num8"
	name = "Eight"
	desc = "Eight."

/obj/structure/sign/deathnet/num9
	icon_state="num9"
	name = "Nine"
	desc = "Nine."

/obj/structure/sign/deathnet/num10
	icon_state="num10"
	name = "Ten"
	desc = "Ten."

/obj/structure/sign/deathnet/watcher
	icon_state="watcher"
	name = "Watcher"
	desc = "He is present."

/obj/structure/sign/deathnet/reddarkstar
	icon_state="reddarkstar"
	name = "Extreme Risk"
	desc = "Get out of here, immediately."


//DEATHNET SIGNS

/obj/structure/sign/grafitti
	icon = 'icons/obj/grafitti.dmi'
	name = "grafitti"
	desc = "Good job to the asshole who ruined this wall."
	icon_state = "grafitti1"

/obj/structure/sign/grafitti/smile
	name = "grafitti"
	desc = "Good job to the asshole who ruined this wall."
	icon_state = "grafitti29"

/obj/structure/sign/signnew/wallhole
	name = "Grille"
	desc = "Looks busted open. Maybe something terrible was here.."
	icon_state = "wallhole"

/obj/structure/sign/signnew/wallhole2
	name = "Grille"
	desc = "Just another grille in the wall."
	icon_state = "wallhole2"

/obj/structure/sign/signnew/pipe
	name = "Pipe"
	desc = "You can hear something scattering inside."
	icon_state = "pipe"

/obj/structure/sign/signnew/pipe1
	name = "Pipe"
	desc = "You can hear something scattering inside. Looks busted open. Maybe something terrible was here..."
	icon_state = "pipe1"

/obj/structure/sign/signnew/pipesmall
	name = "Pipe"
	desc = "You can hear something scattering inside."
	icon_state = "pipesmall"

