/obj/effect/damagedfloor
	icon = 'damage_overlays.dmi'
	icon_state = "damaged1"

/obj/effect/damagedfloor/fire
	icon_state = "scorched1"

/obj/effect/damagedfloor/rust
	icon_state = "rust"

/obj/effect/damagedfloor/New(loc)
	var/turf/simulated/floor/F = loc
	if(istype(F))
		if(istype(src, /obj/effect/damagedfloor/fire))
			F.burn_tile()
		else
			F.break_tile(istype(src, /obj/effect/damagedfloor/rust))
	qdel(src)