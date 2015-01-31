#include "pods_controller.dm"

var/station_name = "NSV Luna"
var/vessel_type = "ship"
var/list/vessel_z = list(1,2,3,4)
var/asteroid_z = 8
var/centcomm_z = 6
var/evac_type = "pods"
var/list/accessable_z_levels = list("1" = 10, "2" = 10, "3" = 10, "4" = 10, "5" = 20, "8" = 40)


/obj/effect/mapinfo/ship/luna
	name = "NSV Luna"
//	landing_area = /area/ship/scrap/shuttle/ingoing
	obj_type = /obj/effect/map/ship/luna
	mapx = 4
	mapy = 4

/obj/effect/map/ship/luna
	name = "generic ship"
	desc = "Space faring vessel."
	icon = 'maps/overmap/bearcat/bearcat.dmi'
	icon_state = "ship"