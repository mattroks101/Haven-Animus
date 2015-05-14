/obj/structure/railing
	name = "railing"
	desc = "A railing."
	icon = 'icons/obj/railing.dmi'
	density = 1
	layer = 3.2//Just above doors
	pressure_resistance = 4*ONE_ATMOSPHERE
	anchored = 1.0
	flags = ON_BORDER
	icon_state = "railing"

/obj/structure/railing/New()
	if(dir == SOUTH)
		src.layer = 4.1

/obj/structure/railing/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(istype(mover) && mover.checkpass(PASSGLASS))
		return 1
	if(get_dir(loc, target) == dir)
		return !density
	else
		return 1


/obj/structure/railing/CheckExit(atom/movable/O as mob|obj, target as turf)
	if(istype(O) && O.checkpass(PASSGLASS))
		return 1
	if(get_dir(O.loc, target) == dir)
		return 0
	return 1



/obj/structure/railing/corner
	desc = "A railing corner."
	icon_state = "corner"
	layer = 4.1

/obj/structure/railing/corner/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(istype(mover) && mover.checkpass(PASSGLASS))
		return 1
	if(dir == EAST)
		if((get_dir(loc, target) == WEST) || (get_dir(loc, target) == NORTH))
			return 1
	else if(dir == WEST)
		if((get_dir(loc, target) == EAST) || (get_dir(loc, target) == SOUTH))
			return 1
	else
		return 0

/obj/structure/railing/corner/CheckExit(atom/movable/O as mob|obj, target as turf)
	if(istype(O) && O.checkpass(PASSGLASS))
		return 1

	if(dir == EAST)
		if((get_dir(loc, target) == WEST) || (get_dir(loc, target) == NORTH))
			return 0
	else if(dir == WEST)
		if((get_dir(loc, target) == EAST) || (get_dir(loc, target) == SOUTH))
			return 0

	if(get_dir(O.loc, target) == dir)
		return 0
	return 1

/obj/structure/railing/attack_hand(mob/user as mob)


	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.a_intent == "disarm")
			if(prob(70))
				visible_message("<span class='notice'>[user] climbs on the [src].</span>")
				if(user.loc == src.loc)
					switch(dir)
						if(SOUTH)
							user.y = src.y - 1
						if(NORTH)
							user.y = src.y + 1
						if(WEST)
							user.x = src.x - 1
						if(EAST)
							user.x = src.x + 1
				else	H.loc = src.loc
					return 1
			else
				sleep(5)
				visible_message("<span class='warning'>[user] slipped off the edge of the [src].</span>")
				usr.weakened += 3

	return