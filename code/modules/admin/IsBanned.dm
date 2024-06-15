//Blocks an attempt to connect before even creating our client datum thing.
world/IsBanned(key,address,computer_id)
	if(ckey(key) in admin_datums)
		return ..()

	//Guest Checking
	if(!guests_allowed && IsGuestKey(key))
		log_access("Failed Login: [key] - Guests not allowed")
		message_admins("\blue Failed Login: [key] - Guests not allowed")
		return list("reason"="guest", "desc"="\nYou are not allowed here.")

	//check if the IP address is a known TOR node
	if(config && config.ToRban && ToRban_isbanned(address))
		log_access("Failed Login: [src] - Banned: ToR")
		message_admins("\blue Failed Login: [src] - Banned: ToR")
		//ban their computer_id and ckey for posterity
		AddBan(ckey(key), computer_id, "Use of ToR", "Automated Ban", 0, 0)
		return list("reason"="Using ToR", "desc"="\nYou are not allowed here.")

	//Ban Checking
	. = CheckBan( ckey(key), computer_id, address )
	if(.)
		log_access("Failed Login: [key] [computer_id] [address] - Banned [.["reason"]]")
		message_admins("\blue Failed Login: [key] id:[computer_id] ip:[address] - Banned [.["reason"]]")
		return list("reason"="banned", "desc"="\nYou are not allowed here.")

	//whitelist
	if(config.deathnet_cap_enabled)
		if((("[key]" in comrade_players) && config.deathnet_cap_vet) || (("[key]" in technocrat_players) && config.deathnet_cap_techno))
			return ..()
		else if(length(clients)+1 > config.deathnet_player_cap)
			return list("reason"="player cap", "desc"="\nYou are not allowed here.")

	return ..()	//default pager ban stuff

#define DEATHNETCONFIGFILE "config/deathnet/config.txt"

/datum/configuration
	var/deathnet_cap_enabled = 0
	var/deathnet_player_cap = 50
	var/deathnet_cap_vet = 0
	var/deathnet_cap_techno = 0
	var/deathnet_cap_admin = 0

/hook/startup/proc/loadDeathnetConfig()
	var/list/Lines = file2list(DEATHNETCONFIGFILE)
	for(var/t in Lines)
		if(!t)	continue

		t = trim(t)
		if (length(t) == 0)
			continue
		else if (copytext(t, 1, 2) == "#")
			continue

		var/pos = findtext(t, " ")
		var/name = null
		var/value = null

		if (pos)
			name = lowertext(copytext(t, 1, pos))
			value = copytext(t, pos + 1)
		else
			name = lowertext(t)

		if (!name)
			continue
		switch(name)
			if("deathnet_cap_enabled")
				config.deathnet_cap_enabled = 1

			if("deathnet_player_cap")
				config.deathnet_player_cap = text2num(value)

			if("deathnet_cap_vet")
				config.deathnet_cap_vet = 1

			if("deathnet_cap_techno")
				config.deathnet_cap_techno = 1
	
			if("deathnet_cap_admin")
				config.deathnet_cap_admin = 1

	return 1