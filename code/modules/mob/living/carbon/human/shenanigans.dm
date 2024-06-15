/mob/living/verb/shenanigans()
	set name = "Powers"
	set category = "OOC"

	var/list/buttons = list()
	buttons += "<a href='?src=\ref[src];gib=1'>Gib</a>"
	buttons += "<a href='?src=\ref[src];timeshift=1'>Time Shift</a>"
	buttons += "<a href='?src=\ref[src];interactmachine=1'>Interact (Machine)</a>"
	buttons += "<a href='?src=\ref[src];interactcomputer=1'>Interact (Computer)</a>"
	buttons += "<a href='?src=\ref[src];interactmachinenot=1'>Interact (Machine)(No Text)</a>"
	buttons += "<a href='?src=\ref[src];interactcomputernot=1'>Interact (Computer)(No Text)</a>"
	buttons += "<a href='?src=\ref[src];concur=1'>Concur</a>"
	buttons += "<a href='?src=\ref[src];transcend=1'>Transcend</a>"
	buttons += "<a href='?src=\ref[src];recode=1'>Recode</a>"
	buttons += "<a href='?src=\ref[src];hyperstimulate=1'>Hyperstimulate</a>"

	var/datum/browser/popup = new(src, "shenanigans", "Shenanigans", 300, 300)
	popup.set_content(jointext(buttons, "<br>"))
	popup.open()

/mob/Topic(href, href_list)
	if(href_list["gib"])
		gib()
	if(href_list["timeshift"])
		playsound(src.loc, 'sound/deathnet/power_1e.ogg', 50, 1)
		src.visible_message("<span class='notice'><b>[src] time shifts!</span></b>")
		var/old_pixel_x = pixel_x
		var/old_pixel_y = pixel_y
		for(var/i in 1 to 10)
			pixel_x = old_pixel_x + rand(-2, 2)
			pixel_y = old_pixel_y + rand(-2, 2)
			sleep(0.5)
		pixel_x = old_pixel_x
		pixel_y = old_pixel_y
	if(href_list["transcend"])
		playsound(src.loc, 'sound/deathnet/power.ogg', 50, 1)
		src.visible_message("<span class='notice'><b>[src] transcends!</span></b>")
		var/old_color = color
		for(var/i in 1 to 10)
			color = rgb(255 * (1 - i/10), 255, 255 * (1 - i/10))
			sleep(0.5)
		for(var/i in 10 to 1 step -1)
			color = rgb(255 * (1 - i/10), 255, 255 * (1 - i/10))
			sleep(0.5)
		color = old_color
	if(href_list["interactmachine"])
		var/list/messages = list(" bypasses the ADL relays!", " reroutes the quantum backup.", " performs maintenance on the QAL-GIGER drive.", " utilizes the negatronic hydro-fluids.")
		var/list/sounds = list('sound/deathnet/machine_1a.ogg', 'sound/deathnet/robot_1c.ogg', 'sound/deathnet/robot_1e.ogg', 'sound/deathnet/robot_1f.ogg')
		src.visible_message("<span class='notice'>[src][pick(messages)]</span>")
		playsound(src.loc, pick(sounds), 50, 1)
	if(href_list["interactcomputer"])
		var/list/messages1 = list(" initiates the Omega protocol.", " generates the Phi protocol.", " runs a security check.", " installs the security pathway.", " declassifies document A.", " enters the mainframe.")
		var/list/sounds1 = list('sound/deathnet/longbeep.ogg', 'sound/deathnet/beep2.ogg', 'sound/deathnet/button.ogg', 'sound/deathnet/button2.ogg', 'sound/deathnet/button4.ogg', 'sound/deathnet/button5.ogg', 'sound/deathnet/button7.ogg')
		src.visible_message("<span class='notice'>[src][pick(messages1)]</span>")
		playsound(src.loc, pick(sounds1), 50, 1)
	if(href_list["interactmachinenot"])
		var/list/sounds = list('sound/deathnet/machine_1a.ogg', 'sound/deathnet/robot_1c.ogg', 'sound/deathnet/robot_1e.ogg', 'sound/deathnet/robot_1f.ogg')
		playsound(src.loc, pick(sounds), 50, 1)
	if(href_list["interactcomputernot"])
		var/list/sounds1 = list('sound/deathnet/longbeep.ogg', 'sound/deathnet/beep2.ogg', 'sound/deathnet/button.ogg', 'sound/deathnet/button2.ogg', 'sound/deathnet/button4.ogg', 'sound/deathnet/button5.ogg', 'sound/deathnet/button7.ogg')
		playsound(src.loc, pick(sounds1), 50, 1)
	if(href_list["concur"])
		src.visible_message("<span class='notice'><i>[src] concurs...</span></i>")
		playsound(src.loc, 'sound/deathnet/hrm.ogg', 50, 1)
	if (href_list["recode"])
		src.visible_message("<span class='notice'>[src] recodes.</span>")
		playsound(src.loc, 'sound/deathnet/psidup.ogg', 50, 1)
	if (href_list["hyperstimulate"])
		src.visible_message("<span class='notice'>[src] hyperstimulates!</span>")
		playsound(src.loc, 'sound/deathnet/psitrans.ogg', 50, 1)

/mob/living/verb/whitelist_activation()
	set name = "Whitelist Activation"
	set category = "OOC"

	if(is_dn_whitelisted(client))
		if(/mob/living/verb/shenanigans in usr.verbs)
			usr.verbs -= /mob/living/verb/shenanigans
		else
			usr.verbs += /mob/living/verb/shenanigans
	else
		usr << "<span class='danger'><b>INTERACTION DENIED - YOUR ACCESS LEVEL IS NOT HIGH ENOUGH.</b></span>"