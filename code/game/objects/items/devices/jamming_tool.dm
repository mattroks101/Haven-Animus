/obj/item/device/jamming_tool
	name = "jamming tool"
	desc = "A small electronic device."
	icon_state = "jammer"
	m_amt = 500
	g_amt = 100
	origin_tech = "magnets=2"
	var/on = 0

	attack_self(mob/user)
		if(!user)	return 0
		on = !on
		user << "<span class='notice'>You toogle [src] [on ? "on" : "off"] </span>"
		var/turf/T = get_turf(src)
		T.visible_message("\icon[src] *beeps*\ ")
		return 1

/proc/jamming_tool_in_radius(R, atom/A)
	var/list/turf_list = list()
	for(var/turf/T in orange(R, A.loc))
		turf_list.Add(T)

	for(var/obj/item/device/jamming_tool/J in world)
		if(J.on)
			for(var/turf/T in turf_list)
				if((J.loc.x == T.x) && (J.loc.y == T.y))
					return 1
	return 0
