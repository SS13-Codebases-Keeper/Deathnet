#define WHITELISTFILE "data/whitelist.txt"
#define DEATHNETWHITELISTFILE "config/deathnet/whitelist.txt"
#define DEATHNETTECHNOCRATFILE "config/deathnet/technocrats.txt"

var/list/whitelist = list()

/hook/startup/proc/loadWhitelist()
	if(config.usewhitelist)
		load_whitelist()
	return 1

/proc/load_whitelist()
	whitelist = file2list(WHITELISTFILE)
	if(!whitelist.len)	whitelist = null

/proc/check_whitelist(mob/M /*, var/rank*/)
	if(!whitelist)
		return 0
	return ("[M.ckey]" in whitelist)

var/list/comrade_players = list()

/hook/startup/proc/loadComradeWhitelist()
	load_comrades()
	return 1

/proc/load_comrades()
	comrade_players = file2list(DEATHNETWHITELISTFILE)
	if(!comrade_players.len)	comrade_players = null

/proc/is_dn_whitelisted(client/user)
	if(!comrade_players)
		return 0
	return ("[user.key]" in comrade_players)

var/list/technocrat_players = list()

/hook/startup/proc/loadTechnocratWhitelist()
	load_technocrats()
	return 1

/proc/load_technocrats()
	technocrat_players = file2list(DEATHNETTECHNOCRATFILE)
	if(!technocrat_players.len)	technocrat_players = null

/proc/is_dn_technocrat(client/user)
	if(!technocrat_players)
		return 0
	return ("[user.key]" in technocrat_players)

/var/list/alien_whitelist = list()

/hook/startup/proc/loadAlienWhitelist()
	if(config.usealienwhitelist)
		load_alienwhitelist()
	return 1

/proc/load_alienwhitelist()
	var/text = file2text("config/alienwhitelist.txt")
	if (!text)
		diary << "Failed to load config/alienwhitelist.txt\n"
	else
		alien_whitelist = text2list(text, "\n")

//todo: admin aliens
/proc/is_alien_whitelisted(mob/M, var/species)
	if(!config.usealienwhitelist)
		return 1
	if(species == "human" || species == "Human")
		return 1
	if(check_rights(R_ADMIN, 0))
		return 1
	if(!alien_whitelist)
		return 0
	if(M && species)
		for (var/s in alien_whitelist)
			if(findtext(s,"[M.ckey] - [species]"))
				return 1
			if(findtext(s,"[M.ckey] - All"))
				return 1

	return 0

/hook/startup/proc/loadWordFilter()
	load_wordfilter()
	return 1

/proc/load_wordfilter()
	var/list/text = file2list("config/deathnet/word filter.txt")
	var/regextext

	var/counter = 0
	for(var/thing in text)
		if(!counter)
			regextext = "[thing]"
		else
			regextext += "|[thing]"
		counter++
	world << "[regextext]"
	config.word_filter_regex = regex((@"\b\w*(" + "[regextext]"+ @")\w*\b"))

#undef WHITELISTFILE