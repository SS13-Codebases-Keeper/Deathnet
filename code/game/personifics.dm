// Define a global list of skills
var/global/list/skills = list("Violence", "Psycho-Linguistics", "Meta-Strategy", "Omega Calculus", "Anomaly Detection", "Hyper-Cognition", "Reality Distortion", "Quantum Surgery", "Quantum Medicine")

// Define a global list of aptitude levels
var/global/list/aptitude_levels = list("Inept", "Insignificor", "Initiate", "Artisan", "Magus", "Savant", "Sovereign", "Harbringer")

// Define a global list to store the aptitude level for each skill
var/global/list/skill_aptitudes = list()
// Define a global list of skill descriptions
var/global/list/skill_descriptions = list(
	"Violence" = "Test your mettle. Who lives and dies is in your hands, now.",
	"Psycho-Linguistics" = "Language. Symbols. Gestures. Ideas-- it's all yours to impose onto others.",
	"Meta-Strategy" = "Use this to control your agents, coordinate attacks and achieve what you want accomplished.",
	"Omega Calculus" = "Your innate understanding of the Omega draws from your inner well of intellect. Accurately predict outcomes, transcend limitations and determine solutions.",
	"Anomaly Detection" = "Anomaly Detection: You can sense disturbances. Hey, why not get rich in the process, am I right?",
	"Hyper-Cognition" = "The ability to process and analyze large amounts of information at superhuman speed and accuracy. A skilled practitioner can use this skill to assess situations, devise strategies, or outsmart opponents. You'll also never lose an argument with your parents again.",
	"Reality Distortion" = "Manipulate light, shadow and the very molecules that make up this world.",
	"Quantum Surgery" = "Your aptitude with Quantum surgical procedures.",
	"Quantum Medicine" = "Your aptitude with Quantum medical procedures.",
	"Psy-Control" = "You're a Psyker. Can't you bend spoons already? "
)


/mob/living/verb/personifics()
	set name = "Skills"
	set category = "Personifics"

	if(!skill_aptitudes.len)
		for(var/skill in skills)
			skill_aptitudes[skill] = pick(aptitude_levels)

	for(var/skill in skills)
		src << "<a href='?src=/ref(src);skill=[skill]'><font color='#3c3f61'><b>[skill]</b>: <font color='#080f72'>[skill_aptitudes[skill]]</a>"

/mob/living/verb/uselessdud()
	set name = "Secrets" //lmaooo a a a a a 
	set hidden = 1

	src << "<span class='danger'><b>INTERACTION DENIED - YOUR ACCESS LEVEL IS NOT HIGH ENOUGH.</b></span>"