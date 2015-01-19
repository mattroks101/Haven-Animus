#if !defined(MAP_FILE)

        #include "mapfiles\NSV_Luna11321.dmm"

        #define MAP_FILE "NSV_Luna11321.dmm"
        #define MAP_NAME "NSV Luna"

#elif !defined(MAP_OVERRIDE)

	#warn a map has already been included, ignoring NSV Luna.

#endif

var/station_name = "NSV Luna"
var/vessel_type = "ship"
var/list/vessel_z = list(1,2,3,4)
var/asteroid_z = 8
var/centcomm_z = 6
var/evac_type = "pods"
var/list/accessable_z_levels = list("1" = 10, "2" = 10, "3" = 10, "4" = 10, "5" = 20, "8" = 40)

#include "pods_controller.dm"