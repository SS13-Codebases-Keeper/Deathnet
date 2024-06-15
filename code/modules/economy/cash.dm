/obj/item/weapon/spacecash
	name = "0 credit chip"
	desc = "It's worth 0 credits."
	gender = PLURAL
	icon = 'icons/obj/items.dmi'
	icon_state = "rontz1"
	opacity = 0
	density = 0
	anchored = 0.0
	force = 1.0
	throwforce = 1.0
	throw_speed = 1
	throw_range = 2
	w_class = 1.0
	var/access = list()
	access = access_crate_cash
	var/worth = 0

/obj/item/weapon/spacecash/c1
	name = "white rontz"
	icon_state = "rontz1"
	desc = "It's worth 1 rontz."
	worth = 1

/obj/item/weapon/spacecash/c10
	name = "red rontz"
	icon_state = "rontz10"
	desc = "It's worth 10 rontz."
	worth = 10

/obj/item/weapon/spacecash/c20
	name = "yellow rontz"
	icon_state = "rontz20"
	desc = "It's worth 20 rontz."
	worth = 20

/obj/item/weapon/spacecash/c50
	name = "green rontz"
	icon_state = "rontz50"
	desc = "It's worth 50 rontz."
	worth = 50

/obj/item/weapon/spacecash/c100
	name = "purple rontz"
	icon_state = "rontz100"
	desc = "It's worth 100 rontz."
	worth = 100

/obj/item/weapon/spacecash/c200
	name = "ultraviolet rontz"
	icon_state = "rontz200"
	desc = "It's worth 200 rontz."
	worth = 200

proc/spawn_money(var/sum, spawnloc)
	var/cash_type
	for(var/i in list(200,100,50,20,10,1))
		cash_type = text2path("/obj/item/weapon/spacecash/c[i]")
		while(sum >= i)
			sum -= i
			new cash_type(spawnloc)
	return