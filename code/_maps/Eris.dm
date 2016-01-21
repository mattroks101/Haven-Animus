#include "pods_controller.dm"

var/vessel_name = "CEV Eris"
var/vessel_type = "ship"
var/list/vessel_z = list(1,2,3,4,5)
var/asteroid_z = 8 //This
var/centcomm_z = 6
var/evac_type = "pods"
var/list/accessable_z_levels = list("1" = 10, "2" = 10, "3" = 10, "4" = 10, "5" = 10, "7" = 20, "8" = 20)


/obj/effect/mapinfo/ship/eris
	name = "CEV Eris"
	shipname = "CEV Eris"
	obj_type = /obj/effect/map/ship/eris
	mapx = 11
	mapy = 10

/obj/effect/map/ship/eris
	shipname = "CEV Eris"
	name = "generic ship"
	desc = "Space faring vessel."
	icon = 'maps/overmap/bearcat/bearcat.dmi'
	icon_state = "luna"	//This