/obj/machinery/power/deathnetengine
	name = "THE GENERATOR"
	desc = "The object is simply indescribable. Tsunamis of energy flow around you, shaking you to your very core."
	icon = 'icons/deathnet_generator.dmi'
	pixel_x = -32
	pixel_y = -32
	icon_state = "engine"
	anchored = 1
	density = 1
	layer = 6
	luminosity = 8
	unacidable = 1
	use_power = 0

/obj/machinery/power/commandtable
	name = "Command Desk"
	desc = "An ancient holographic display to tend to your authority needs."
	icon = 'icons/obj/96x96.dmi'
	pixel_y = -32
	pixel_x = -32
	icon_state = "commandtable"
	anchored = 1
	density = 1
	luminosity = 4
	unacidable = 1
	use_power = 0

/obj/machinery/power/deathnetconsole/left
	name = "Generator Controls"
	desc = "A neuro-psychatropic energy conversion monitor."
	icon = 'icons/engineconsole.dmi'
	icon_state = "left"
	anchored = 1
	unacidable = 1
	use_power = 0
	density = 1
/obj/machinery/power/deathnetconsole/right
	name = "Generator Controls"
	desc = "A neuro-psychatropic energy conversion monitor."
	icon = 'icons/engineconsole.dmi'
	icon_state = "right"
	anchored = 1
	unacidable = 1
	use_power = 0
	density = 1

/obj/machinery/power/faux/
	icon = 'icons/obj/fauxmachines.dmi'
	var/list/namesfaux = list("Chronoclast Array", "Entropic Siphon", "Hyperstitional Prodigy", "Cthonic Gatekeeper", "Liminoidal Transmuter", "Phantasmagoric Cascade", "Occultic Metamorph", "Apocalyptic Catalyst", "Xenomorphic Resonator")
	var/list/descriptionsfaux = list ("A dispositif that can interrupt the sequential progression of events, allowing for the possibility of retrocausality and the disruption of established historical trajectories. It operates by modulating the quantum topology of spacetime, creating localized perturbations in the fabric of reality.", " A device that harnesses the inherent thermodynamic instability of the universe to generate vast amounts of energy. It operates by channeling the chaotic fluctuations of the vacuum, using sophisticated quantum control mechanisms to extract usable power from the resulting entropic flux.", "A machine intelligence that is capable of generating and propagating novel ontological entities and conceptual frameworks. It operates by utilizing sophisticated algorithmic techniques to identify and exploit epistemological gaps and inconsistencies, thereby producing new and unpredictable modes of thought.", "A device that is capable of catalyzing the emergence of a technological singularity. It operates by using advanced artificial intelligence to recursively improve upon its own design, rapidly accelerating the pace of technological progress and fundamentally altering the nature of human society.", "A device that is able to access and manipulate the hidden dimensions of reality that lie beneath the surface of everyday experience. It operates by using esoteric mathematical techniques to unlock the portals to these otherworldly realms, enabling the user to explore their mysteries and harness their power.", "A device that is able to transform the nature of reality itself by creating transitional states of being that exist between different ontological categories. It operates by using complex quantum field manipulations to destabilize the boundaries between different modes of existence, enabling the user to explore and exploit the liminal spaces that exist between them.", "A device that is capable of generating hallucinatory visions and immersive sensory experiences. It operates by using sophisticated neurofeedback techniques to interface with the user's brain, inducing altered states of consciousness that can manifest as vivid and compelling hallucinations.", "A device that is able to effect profound and irreversible changes to the user's physical and metaphysical constitution. It operates by using advanced nanotechnologies and genetic engineering techniques to rewrite the user's genetic code, transforming them into a new and fundamentally different form of being.", "A device that is able to precipitate cataclysmic events on a global scale. It operates by using sophisticated weather modification technologies and tectonic destabilization techniques to unleash devastating storms, earthquakes, and other natural disasters that can threaten the very existence of civilization itself.", "A device that is able to interface with alien intelligences and extraterrestrial dimensions of reality. It operates by using advanced communication protocols and esoteric mathematics to establish contact with non-human entities, enabling the user to explore the mysteries of the cosmos and potentially unlock vast new frontiers of knowledge and power.")
	New()
		if(!istype(src, /obj/machinery/power/faux/cloningmachine))
			name = pick(namesfaux)
			desc = pick(descriptionsfaux)
		..()
	use_power = 0
	idle_power_usage = 0
	active_power_usage = 0
	dn_comrade_only = 1

/obj/machinery/power/faux/attack_hand(mob/user as mob)
    if(dn_comrade_only)
        if(!is_dn_whitelisted(user.client))
            user << "<span class='danger'><b>INTERACTION DENIED - YOUR ACCESS LEVEL IS NOT HIGH ENOUGH.</b></span>"
            return FALSE
    return ..()

/obj/machinery/power/faux/cloningmachine
	name = "Vat-Tube"
	desc = "It's terrifying."
	icon = 'icons/obj/36x42.dmi'
	icon_state = "machine"
	anchored = 1
	density = 1
	New()
		..()


/obj/machinery/power/faux/machine1
	icon_state = "machine1"
	anchored = 1
	density = 1

/obj/machinery/power/faux/machine2
	icon_state = "machine2"
	anchored = 1
	density = 1

/obj/machinery/power/faux/machine3
	icon_state = "machine3"
	anchored = 1
	density = 1

/obj/machinery/power/faux/machine4
	icon_state = "machine4"
	anchored = 1
	density = 1

/obj/machinery/power/faux/machine5
	icon_state = "machine5"
	anchored = 1
	density = 1

/obj/machinery/power/faux/consolebroken
	name = "broken console"
	icon_state = "consolebroken"
	anchored = 1
	density = 1

/obj/machinery/power/faux/consoleoff
	name = "console"
	icon_state = "console-o"
	anchored = 1
	density = 1

/obj/machinery/power/faux/consolered
	name = "console"
	icon_state = "consolered"
	anchored = 1
	density = 1

/obj/machinery/power/faux/consoleblue
	name = "console"
	icon_state = "consoleblue"
	anchored = 1
	density = 1

/obj/machinery/power/faux/consoleyellow
	name = "console"
	icon_state = "consoleyellow"
	anchored = 1
	density = 1