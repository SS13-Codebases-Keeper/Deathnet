#include "pods_controller.dm"

var/vessel_name = ""
var/vessel_type = "ship"
var/list/vessel_z = list(1,2,3,4)
var/asteroid_z = 8
var/centcomm_z = 6
var/evac_type = "pods"
var/list/accessable_z_levels = list("1" = 10, "2" = 10, "3" = 10, "4" = 10, "5" = 20, "7" = 20, "8" = 20)


/obj/effect/mapinfo/ship/luna
	name = "DEATHNET"
	shipname = "DEATHNET"
	obj_type = /obj/effect/map/ship/luna
	mapx = 11
	mapy = 10

/obj/effect/map/ship/luna
	shipname = "DEATHNET"
	name = "generic ship"
	desc = "Space faring vessel."
	icon = 'maps/overmap/bearcat/bearcat.dmi'
	icon_state = "luna"