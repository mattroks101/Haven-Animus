//A creative copypasta of the mining shuttle code

#define FIRST 1
#define SECOND 0

var/cargo_elevator_tickstomove = 30
var/cargo_elevator_moving = 0
var/cargo_elevator_location = FIRST // 0 = station 13, 1 = mining station

proc/move_cargo_elevator()
	if(cargo_elevator_moving)	return
	cargo_elevator_moving = 1
	spawn(cargo_elevator_tickstomove)
		var/area/fromArea
		var/area/toArea
		if (cargo_elevator_location == FIRST)
			fromArea = locate(/area/shuttle/elevator/cargo/first)
			toArea = locate(/area/shuttle/elevator/cargo/second)

		else
			fromArea = locate(/area/shuttle/elevator/cargo/second)
			toArea = locate(/area/shuttle/elevator/cargo/first)

		var/list/dstturfs = list()
		var/throwy = world.maxy

		for(var/turf/T in toArea)
			dstturfs += T
			if(T.y < throwy)
				throwy = T.y

		// hey you, get out of the way!
		if(cargo_elevator_location == SECOND)		//It means that the elevator can destroy something, because it is moving down.
			for(var/turf/T in dstturfs)
				// find the turf to move things to
				var/turf/D = locate(T.x, throwy - 1, 1)
				//var/turf/E = get_step(D, SOUTH)

				for(var/atom/movable/AM as mob|obj in T)
					if(istype(AM, /mob/living))
						var/mob/living/victim = AM
						victim.gib()
					else
						AM.Move(D)
					// NOTE: Commenting this out to avoid recreating mass driver glitch
					/*
					spawn(0)
						AM.throw_at(E, 1, 1)
						return
					*/

				if(istype(T, /turf/simulated))
					del(T)

			for(var/mob/living/carbon/bug in toArea) // If someone somehow is still in the shuttle's docking area...
				bug.gib()

			for(var/mob/living/simple_animal/pest in toArea) // And for the other kind of bug...
				pest.gib()

		if(cargo_elevator_location == FIRST)
			fromArea.move_contents_to(toArea, /turf/simulated/floor/plating)
		else
			fromArea.move_contents_to(toArea, /turf/simulated/floor/open)

		if (cargo_elevator_location == FIRST)
			cargo_elevator_location = SECOND
		else
			cargo_elevator_location = FIRST

		cargo_elevator_moving = 0
	return



var/medbay_elevator_tickstomove = 30
var/medbay_elevator_moving = 0
var/medbay_elevator_location = FIRST // 0 = station 13, 1 = mining station

proc/move_medbay_elevator()
	if(medbay_elevator_moving)	return
	medbay_elevator_moving = 1
	spawn(medbay_elevator_tickstomove)
		var/area/fromArea
		var/area/toArea
		if (medbay_elevator_location == FIRST)
			fromArea = locate(/area/shuttle/elevator/medbay/first)
			toArea = locate(/area/shuttle/elevator/medbay/second)

		else
			fromArea = locate(/area/shuttle/elevator/medbay/second)
			toArea = locate(/area/shuttle/elevator/medbay/first)

		var/list/dstturfs = list()
		var/throwy = world.maxy

		for(var/turf/T in toArea)
			dstturfs += T
			if(T.y < throwy)
				throwy = T.y

		// hey you, get out of the way!
		if(medbay_elevator_location == SECOND)		//It means that the elevator can destroy something, because it is moving down.
			for(var/turf/T in dstturfs)
				// find the turf to move things to
				var/turf/D = locate(T.x, throwy - 1, 1)
				//var/turf/E = get_step(D, SOUTH)

				for(var/atom/movable/AM as mob|obj in T)
					if(istype(AM, /mob/living))
						var/mob/living/victim = AM
						victim.gib()
					else
						AM.Move(D)
					// NOTE: Commenting this out to avoid recreating mass driver glitch
					/*
					spawn(0)
						AM.throw_at(E, 1, 1)
						return
					*/

				if(istype(T, /turf/simulated))
					del(T)

			for(var/mob/living/carbon/bug in toArea) // If someone somehow is still in the shuttle's docking area...
				bug.gib()

			for(var/mob/living/simple_animal/pest in toArea) // And for the other kind of bug...
				pest.gib()

		if(medbay_elevator_location == FIRST)
			fromArea.move_contents_to(toArea, /turf/simulated/floor/plating)
		else
			fromArea.move_contents_to(toArea, /turf/simulated/floor/open)

		if (medbay_elevator_location == FIRST)
			medbay_elevator_location = SECOND
		else
			medbay_elevator_location = FIRST

		medbay_elevator_moving = 0
	return

#undef FIRST
#undef SECOND

/obj/machinery/elevator_button
	icon = 'icons/obj/airlock_machines.dmi'
	icon_state = "access_button_standby"
	name = "elevator button"

	anchored = 1
	power_channel = ENVIRON

	var/on = 1


/obj/machinery/elevator_button/update_icon()
	if(on)
		icon_state = "access_button_standby"
	else
		icon_state = "access_button_off"


/obj/machinery/elevator_button/cargo/attack_hand(mob/user)
	add_fingerprint(usr)

	if(cargo_elevator_moving)
		user << "\red It is already moving"
	move_cargo_elevator()

	flick("access_button_cycle", src)


/obj/machinery/elevator_button/medical/attack_hand(mob/user)
	add_fingerprint(usr)

	if(medbay_elevator_moving)
		user << "\red It is already moving"
	move_medbay_elevator()

	flick("access_button_cycle", src)