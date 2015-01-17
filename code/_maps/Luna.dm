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