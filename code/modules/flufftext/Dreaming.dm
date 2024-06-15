mob/living/carbon/proc/dream()
	dreaming = 1
	var/list/dreams = list(
		"Nick","Land","a wise guy","patterns","life","web","the minister", "defector", "help", "HELP ME", "FUCK", "SOMEONE",
		"voices everywhere","a rogue","town","the engine","death","an ally","darkness", "please", "PLEASE", "no", "NO",
		"light","authorityman","a sludgegun","a catastrophe","a loved one","a gun","warmth","freezing","the SUN",
		"a hat","the city","a ruined house","a planet","the deathnet","cold","the induction bay","the psyker","blinking lights",
		"a red light","an abandoned cave","Sector","The AI","blood","healing","power","respect", "anal", "a dummy", 
		"milady","space","a crash","happiness","pride","a fall","water","flames","ice","magma","flying","child","feet",
		"advisor","bitch", "net", "worm", "dark", "entropy", "mantra", "carotenids",
		"fool","the Hierophant","Roko","Basilisk","sissy","candyman", "spectre", "golem", "bride", "teenager",
		"the informant","order","an average joe","fucking","stupid","a fish tank","troll", "creep", "gematria",
		"you","are","being","tricked","the Wrath","the Outside","noumena","noumenon", "fanged", "numerology",
		"eschatize","the apocalypse","explosion","knife","ruin planet","coward","dreamer","gmyza","hammer","the balls",
		"porn","sex","pussy","dick","hot","babes", "rontz", "synaptica", "chad", "money", "rich", "giga", "pentacle"
		)
	spawn(0)
		for(var/i = rand(1,4),i > 0, i--)
			var/dream_image = pick(dreams)
			dreams -= dream_image
			src << "\blue <i>... [dream_image] ...</i>"
			sleep(rand(40,70))
			if(paralysis <= 0)
				dreaming = 0
				return 0
		dreaming = 0
		return 1

mob/living/carbon/proc/handle_dreams()
	if(prob(5) && !dreaming) dream()

mob/living/carbon/var/dreaming = 0