var/const/AUTH				=(1<<0)

var/const/MINISTER			=(1<<0)
var/const/AUTHCHF			=(1<<1)
var/const/ADVISOR			=(1<<2)
var/const/INFORMANT			=(1<<3)
var/const/AUTHMAN			=(1<<4)
var/const/MAINTCHF			=(1<<5)
var/const/MAINTAINER		=(1<<6)
var/const/MAINTAPP			=(1<<7)
var/const/WATCHMAN			=(1<<8)


var/const/CITIZEN				=(1<<1)

var/const/AMUSER			=(1<<0)
var/const/WORKER			=(1<<1)
var/const/LIAISON			=(1<<2)
var/const/ADVOCATE			=(1<<3)
var/const/PRACTITIONER		=(1<<4)
var/const/PSYKER			=(1<<5)
var/const/CANDYMAN			=(1<<6)
var/const/GAZER				=(1<<7)
var/const/LTNT				=(1<<8)



// DEATHNET JOBS END HERE



var/const/ENGSEC			=(1<<0)

var/const/CAPTAIN			=(1<<0)
var/const/HOS				=(1<<1)
var/const/WARDEN			=(1<<2)
var/const/DETECTIVE			=(1<<3)
var/const/OFFICER			=(1<<4)
var/const/CHIEF				=(1<<5)
var/const/ENGINEER			=(1<<6)
var/const/ATMOSTECH			=(1<<7)
var/const/AI				=(1<<8)
var/const/CYBORG			=(1<<9)


var/const/MEDSCI			=(1<<1)

var/const/RD				=(1<<0)
var/const/SCIENTIST			=(1<<1)
var/const/CHEMIST			=(1<<2)
var/const/CMO				=(1<<3)
var/const/DOCTOR			=(1<<4)
var/const/GENETICIST		=(1<<5)
var/const/VIROLOGIST		=(1<<6)
var/const/ROBOTICIST		=(1<<7)
var/const/XENOBIOLOGIST		=(1<<8)


var/const/CIVILIAN			=(1<<2)

var/const/HOP				=(1<<0)
var/const/BARTENDER			=(1<<1)
var/const/BOTANIST			=(1<<2)
var/const/CHEF				=(1<<3)
var/const/JANITOR			=(1<<4)
var/const/LIBRARIAN			=(1<<5)
var/const/QUARTERMASTER		=(1<<6)
var/const/CARGOTECH			=(1<<7)
var/const/MINER				=(1<<8)
var/const/LAWYER			=(1<<9)
var/const/CHAPLAIN			=(1<<10)
var/const/CLOWN				=(1<<11)
var/const/MIME				=(1<<12)
var/const/ASSISTANT			=(1<<13)


var/list/assistant_occupations = list(
)


var/list/command_positions = list(
	"Minister",
	"Maintenance Chief",
	"Authority Chief",

	//DEATHNET COMMAND ENDS HERE

	"Captain",
	"Head of Personnel",
	"Head of Security",
	"Chief Engineer",
	"Research Director",
	"Chief Medical Officer"
)


var/list/engineering_positions = list(
	"Maintenance Chief",
	"Maintainer",
	"Operational Apprentice",

	//DEATHNET ENGINEERING ENDS HERE

	"Chief Engineer",
	"Vessel Engineer",
	"Atmospheric Technician",
)


var/list/medical_positions = list(
	"Practitioner",

	//DEATHNET MEDICAL ENDS HERE

	"Chief Medical Officer",
	"Medical Doctor",
	"Geneticist",
	"Virologist",
	"Chemist"
)


var/list/science_positions = list( //for psykers
	"Gazer",
	"Psyker",

	//DEATHNET PSYKERS ENDS HERE

	"Research Director",
	"Scientist",
	"Geneticist",	
	"Roboticist"
//	"Xenobiologist"
)

var/list/civilian_positions = list(
	"Hostess",
	"Lieutenant",
	"Worker",
	"Commerce Liaison",
	"Advocate",
	"Candyman",

	//DEATHNET RUBES ENDS HERE

	"Head of Personnel",
	"Bartender",
	"Botanist",
	"Chef",
	"Janitor",
	"Librarian",
	"Quartermaster",
	"Cargo Technician",
	"Shaft Miner",
	"Lawyer",
	"Chaplain",
	"Clown",
	"Mime",
	"Unassigned"
)


var/list/security_positions = list(
	"Advisor", //Here so name is not bold on prefs
	"Authority Chief",
	"Authorityman",
	"Informant",
	"Watchman",

	//DEATHNET SECURITY ENDS HERE

	"Head of Security",
	"Warden",
	"Detective",
	"Security Officer"
)


var/list/nonhuman_positions = list(
	"AI",
	"Cyborg",
	"pAI"
)
