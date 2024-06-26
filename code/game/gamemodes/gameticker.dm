var/global/datum/controller/gameticker/ticker

#define GAME_STATE_PREGAME		1
#define GAME_STATE_SETTING_UP	2
#define GAME_STATE_PLAYING		3
#define GAME_STATE_FINISHED		4


/datum/controller/gameticker
	var/const/restart_timeout = 600
	var/current_state = GAME_STATE_PREGAME

	var/hide_mode = 0
	var/datum/game_mode/mode = null
	var/event_time = null
	var/event = 0

	var/login_music			// music played in pregame lobby

	var/list/datum/mind/minds = list()//The people in the game. Used for objective tracking.

	var/Bible_icon_state	// icon_state the chaplain has chosen for his bible
	var/Bible_item_state	// item_state the chaplain has chosen for his bible
	var/Bible_name			// name of the bible
	var/Bible_deity_name

	var/random_players = 0 	// if set to nonzero, ALL players who latejoin or declare-ready join will have random appearances/genders

	var/list/syndicate_coalition = list() // list of traitor-compatible factions
	var/list/factions = list()			  // list of all factions
	var/list/availablefactions = list()	  // list of factions with openings

	var/pregame_timeleft = 0

	var/delay_end = 0	//if set to nonzero, the round will not restart on it's own

	var/triai = 0//Global holder for Triumvirate
	var/last_message_time = 0 //var to keep track of when a schizo msg was last sent
	var/schizo_time = 0 //when was the last schizo msg sent
	var/rep_time = 0 // ditto above

/datum/controller/gameticker/proc/pregame()
	login_music = pick('sound/deathnet/jingles/trollshit.ogg') //Ground Control to Major Tom, this song is cool, what's going on?
	do
		world << "<B>Welcome to DEATH</B><B><FONT color='red'>NET.</FONT></B>"
		world << "Are you ready for what's coming?"
		world << "The round will start in 180 seconds."
		pregame_timeleft = 180
		while(current_state == GAME_STATE_PREGAME)
			var/ministerReady = 0 // quickly define it here
			for(var/mob/new_player/player in player_list)
				if(player && player.client && player.client.work_chosen)
					if(player.client.work_chosen == "Minister" && player.ready)
						ministerReady = 1
			for(var/i=0, i<10, i++)
				sleep(1)
			vote.process()

			if(going)
				pregame_timeleft--

			if(ministerReady && pregame_timeleft <= 0)
				current_state = GAME_STATE_SETTING_UP
				break

			if(!ministerReady && pregame_timeleft <= 0)
				world << "\red We need a <B>Minister</B> to guide us."
				world << "The round will start in 80 seconds."
				pregame_timeleft = 80

	while (!setup())


/datum/controller/gameticker/proc/setup()
	//Create and announce mode
	if(master_mode=="secret")
		src.hide_mode = 1
	var/list/datum/game_mode/runnable_modes
	if((master_mode=="random") || (master_mode=="secret"))
		runnable_modes = config.get_runnable_modes()
		if (runnable_modes.len==0)
			current_state = GAME_STATE_PREGAME
			world << "<B>Unable to choose playable game mode.</B> Reverting to pre-game lobby."
			return 0
		if(secret_force_mode != "secret")
			var/datum/game_mode/M = config.pick_mode(secret_force_mode)
			if(M.can_start())
				src.mode = config.pick_mode(secret_force_mode)
		job_master.ResetOccupations()
		if(!src.mode)
			src.mode = pickweight(runnable_modes)
		if(src.mode)
			var/mtype = src.mode.type
			src.mode = new mtype
	else
		src.mode = config.pick_mode(master_mode)
	if (!src.mode.can_start())
		world << "<B>Unable to start [mode.name].</B> Not enough players, [mode.required_players] players needed. Reverting to pre-game lobby."
		del(mode)
		current_state = GAME_STATE_PREGAME
		job_master.ResetOccupations()
		return 0

	//Configure mode and assign player to special mode stuff
	job_master.DivideOccupations() //Distribute jobs
	var/can_continue = src.mode.pre_setup()//Setup special modes
	if(!can_continue)
		del(mode)
		current_state = GAME_STATE_PREGAME
		world << "<B>Error setting up [master_mode].</B> Reverting to pre-game lobby."
		job_master.ResetOccupations()
		return 0

	if(hide_mode)
		var/list/modes = new
		for (var/datum/game_mode/M in runnable_modes)
			modes+=M.name
		modes = sortList(modes)
		world << "<B>The current game mode is - Secret!</B>"
		world << "<B>Possibilities:</B> [english_list(modes)]"
	else
		src.mode.announce()

	create_characters() //Create player characters and transfer them
	collect_minds()
	equip_characters()
	data_core.manifest()
	current_state = GAME_STATE_PLAYING
	mute_ooc() //mutes OOC roundstart

	callHook("roundstart")

	//here to initialize the random events nicely at round start
	setup_economy()

	spawn(0)//Forking here so we dont have to wait for this to finish
		mode.post_setup()
		//Cleanup some stuff
		for(var/obj/effect/landmark/start/S in landmarks_list)
			//Deleting Startpoints but we need the ai point to AI-ize people later
			if (S.name != "AI")
				del(S)
		/*world << "<FONT color='blue'><B>Enjoy the game!</B></FONT>"*/
		world << sound('sound/AI/welcome.ogg') // AI WELCOME - CHANGE THIS

	//new random event system is handled from the MC.

	supply_shuttle.process() 		//Start the supply shuttle regenerating points -- TLE
	master_controller.process()		//Start master_controller.process()
//	lighting_controller.process()	//Start processing DynamicAreaLighting updates

	for(var/obj/multiz/ladder/L in world) L.connect() //Lazy hackfix for ladders. TODO: move this to an actual controller. ~ Z
	return 1

/datum/controller/gameticker
	//station_explosion used to be a variable for every mob's hud. Which was a waste!
	//Now we have a general cinematic centrally held within the gameticker....far more efficient!
	var/obj/screen/cinematic = null

	//Plus it provides an easy way to make cinematics for other events. Just use this as a template :)
	proc/station_explosion_cinematic(var/station_missed=0, var/override = null)
		if( cinematic )	return	//already a cinematic in progress!

		//initialise our cinematic screen object
		cinematic = new(src)
		cinematic.icon = 'icons/effects/station_explosion.dmi'
		cinematic.icon_state = "station_intact"
		cinematic.layer = 21
		cinematic.mouse_opacity = 0
		cinematic.screen_loc = "1,0"

		var/obj/structure/stool/bed/temp_buckle = new(src)
		//Incredibly hackish. It creates a bed within the gameticker (lol) to stop mobs running around
		if(station_missed)
			for(var/mob/living/M in living_mob_list)
				M.buckled = temp_buckle				//buckles the mob so it can't do anything
				if(M.client)
					M.client.screen += cinematic	//show every client the cinematic
		else	//nuke kills everyone on z-level of a ship to prevent "hurr-durr I survived"
			for(var/mob/living/M in living_mob_list)
				M.buckled = temp_buckle
				if(M.client)
					M.client.screen += cinematic

				if(M.z == 0)	//inside a crate or something
					var/turf/T = get_turf(M)
					if(T && !(T.z in vessel_z))				//we don't use M.death(0) because it calls a for(/mob) loop and
						M.health = 0
						M.stat = DEAD
				else if(M.z in vessel_z)	//on a ship's turf.
					M.health = 0
					M.stat = DEAD

		//Now animate the cinematic
		switch(station_missed)
			if(1)	//nuke was nearby but (mostly) missed
				if( mode && !override )
					override = mode.name
				switch( override )
					if("nuclear emergency") //Nuke wasn't on station when it blew up
						flick("intro_nuke",cinematic)
						sleep(35)
						world << sound('sound/effects/explosionfar.ogg')
						flick("station_intact_fade_red",cinematic)
						cinematic.icon_state = "summary_nukefail"
					else
						flick("intro_nuke",cinematic)
						sleep(35)
						world << sound('sound/effects/explosionfar.ogg')
						//flick("end",cinematic)


			if(2)	//nuke was nowhere nearby	//TODO: a really distant explosion animation
				sleep(50)
				world << sound('sound/effects/explosionfar.ogg')


			else	//station was destroyed
				if( mode && !override )
					override = mode.name
				switch( override )
					if("nuclear emergency") //Nuke Ops successfully bombed the station
						flick("intro_nuke",cinematic)
						sleep(35)
						flick("station_explode_fade_red",cinematic)
						world << sound('sound/effects/explosionfar.ogg')
						cinematic.icon_state = "summary_nukewin"
					if("AI malfunction") //Malf (screen,explosion,summary)
						flick("intro_malf",cinematic)
						sleep(76)
						flick("station_explode_fade_red",cinematic)
						world << sound('sound/effects/explosionfar.ogg')
						cinematic.icon_state = "summary_malf"
					if("blob") //Station nuked (nuke,explosion,summary)
						flick("intro_nuke",cinematic)
						sleep(35)
						flick("station_explode_fade_red",cinematic)
						world << sound('sound/effects/explosionfar.ogg')
						cinematic.icon_state = "summary_selfdes"
					else //Station nuked (nuke,explosion,summary)
						flick("intro_nuke",cinematic)
						sleep(35)
						flick("station_explode_fade_red", cinematic)
						world << sound('sound/effects/explosionfar.ogg')
						cinematic.icon_state = "summary_selfdes"
				for(var/mob/living/M in living_mob_list)
					if(M.z <= 4)
						M.death()//No mercy
		//If its actually the end of the round, wait for it to end.
		//Otherwise if its a verb it will continue on afterwards.
		sleep(300)

		if(cinematic)	del(cinematic)		//end the cinematic
		if(temp_buckle)	del(temp_buckle)	//release everybody
		return


	proc/create_characters()
		for(var/mob/new_player/player in player_list)
			if(player.ready && player.mind)
				if(player.mind.assigned_role=="AI")
					player.close_spawn_windows()
					player.AIize()
				else if(!player.mind.assigned_role)
					continue
				else
					player.create_character()
					del(player)


	proc/collect_minds()
		for(var/mob/living/player in player_list)
			if(player.mind)
				ticker.minds += player.mind

	proc/mute_ooc()
		ooc_allowed = 0 //Amazingly complex way to mute OOC

	proc/equip_characters()
		var/captainless=1
		for(var/mob/living/carbon/human/player in player_list)
			if(player && player.mind && player.mind.assigned_role)
				if(player.mind.assigned_role == "Minister")
					captainless=0
				if(player.mind.assigned_role != "MODE")
					job_master.EquipRank(player, player.mind.assigned_role, 0)
					EquipCustomItems(player)
		if(captainless)
			for(var/mob/M in player_list)
				if(!istype(M,/mob/new_player))
					M << "\red<b>Without a Minister, our will wavers.</b>"

	proc/schizo_shit()
		if(world.time - schizo_time < 20 MINUTES) // if it hasn't been 20 minutes since this was last called, it doesn't proc
			return
		var/list/schizosnds = list('sound/deathnet/jingles/mystery1.ogg', 'sound/deathnet/jingles/mystery2.ogg', 'sound/deathnet/jingles/mystery3.ogg', 'sound/deathnet/jingles/mystery4.ogg', 'sound/deathnet/jingles/mystery5.ogg', 'sound/deathnet/jingles/mystery6.ogg', 'sound/deathnet/jingles/mystery7.ogg')
		var/list/schizomsgs = list("Behind you.", "Someone's watching.", "You're being watched.", "Something has noticed you.", "Turn around.", "Who was that?", "Is something there?", "Is someone there?", "FLEE.", "ESCAPE.", "The Sun...", "You're not welcome here.", "Something touched you.", "It caresses your psyche.")
		schizo_time = world.time // declare when this procs
		for(var/client/C in clients)
			var/mob/M = C.mob
			if(M.stat == CONSCIOUS && ishuman(M)) // because we don't want lobby-goers or sinners to have this play lol
				C << pick(schizosnds)
				C << "\red\c(217,13,57)" + pick(schizomsgs)
		spawn(1 MINUTES) // i don't Fucking remember why i put this here LMAO ! :cat_joy: :clink: :champagne:
			schizo_shit()

	proc/repview()
		var/reprand = rand(5,60)
		if(world.time - rep_time < reprand MINUTES)
			return
		var/list/repmsgs = list("<B> Profile viewed.</B><i> Approved.</i>.", "<B> Profile viewed.</B><i> Unapproved.</i>.")
		rep_time = world.time
		for(var/client/C in clients)
			var/mob/M = C.mob
			if(M.stat == CONSCIOUS && ishuman(M))
				C << 'sound/deathnet/menu/rep.ogg'
				C << "\red\c(217,13,57)" + pick(repmsgs)
		spawn(reprand MINUTES)
			repview()

	proc/process()	// process() checks if the game is running at all times
		if(current_state != GAME_STATE_PLAYING)		// checks if game is not going, then it proceeds to do some round-end stuff
			return 0
		else
			var/schizo_shit_result = schizo_shit()
			var/repview_result = repview()
			return list(schizo_shit_result, repview_result)

		mode.process()

		emergency_shuttle.process()

		var/mode_finished = mode.check_finished() || (emergency_shuttle.location == 2 && emergency_shuttle.alert == 1)
		if(!mode.explosion_in_progress && mode_finished)
			current_state = GAME_STATE_FINISHED

			spawn
				declare_completion()

			spawn(50)
				callHook("roundend")

				if (mode.station_was_nuked)
					if(!delay_end)
						world << "\blue <B>Rebooting due to destruction of the [vessel_type] in [restart_timeout/10] seconds</B>"
				else
					if(!delay_end)
						world << "\blue <B>Restarting in [restart_timeout/10] seconds</B>"

				if(!delay_end)
					sleep(restart_timeout)
					if(!delay_end)
						world.Reboot()
					else
						world << "\blue <B>An admin has delayed the round end</B>"
				else
					world << "\blue <B>An admin has delayed the round end</B>"

		return 1

	proc/getfactionbyname(var/name)
		for(var/datum/faction/F in factions)
			if(F.name == name)
				return F


/datum/controller/gameticker/proc/declare_completion()

	for(var/mob/M in player_list)
		if(M.client.prefs.toggles & SOUND_MIDI)
			M << 'sound/music/space_asshole.ogg'

	for (var/mob/living/silicon/ai/aiPlayer in mob_list)
		if (aiPlayer.stat != 2)
			world << "<b>[aiPlayer.name] (Played by: [aiPlayer.key])'s laws at the end of the game were:</b>"
		else
			world << "<b>[aiPlayer.name] (Played by: [aiPlayer.key])'s laws when it was deactivated were:</b>"
		aiPlayer.show_laws(1)

		if (aiPlayer.connected_robots.len)
			var/robolist = "<b>The AI's loyal minions were:</b> "
			for(var/mob/living/silicon/robot/robo in aiPlayer.connected_robots)
				robolist += "[robo.name][robo.stat?" (Deactivated) (Played by: [robo.key]), ":" (Played by: [robo.key]), "]"
			world << "[robolist]"

	for (var/mob/living/silicon/robot/robo in mob_list)
		if (!robo.connected_ai)
			if (robo.stat != 2)
				world << "<b>[robo.name] (Played by: [robo.key]) survived as an AI-less borg! Its laws were:</b>"
			else
				world << "<b>[robo.name] (Played by: [robo.key]) was unable to survive the rigors of being a cyborg without an AI. Its laws were:</b>"

			if(robo) //How the hell do we lose robo between here and the world messages directly above this?
				robo.laws.show_laws(world)

	mode.declare_completion()//To declare normal completion.

	//calls auto_declare_completion_* for all modes
	for(var/handler in typesof(/datum/game_mode/proc))
		if (findtext("[handler]","auto_declare_completion_"))
			call(mode, handler)()

	//Print a list of antagonists to the server log
	var/list/total_antagonists = list()
	//Look into all mobs in world, dead or alive
	for(var/datum/mind/Mind in minds)
		var/temprole = Mind.special_role
		if(temprole)							//if they are an antagonist of some sort.
			if(temprole in total_antagonists)	//If the role exists already, add the name to it
				total_antagonists[temprole] += ", [Mind.name]([Mind.key])"
			else
				total_antagonists.Add(temprole) //If the role doesnt exist in the list, create it and add the mob
				total_antagonists[temprole] += ": [Mind.name]([Mind.key])"

	//Now print them all into the log!
	log_game("Antagonists at round end were...")
	for(var/i in total_antagonists)
		log_game("[i]s[total_antagonists[i]].")

	mode.check_round()

	return 1
