/obj/item/device/assembly/jamming_tool
	name = "jamming tool"
	desc = "A small electronic device."
	icon_state = "jammer"
	m_amt = 500
	g_amt = 50
	origin_tech = "magnets=2"
	var/on = 0


	activate()
		if(secured)
			on = !on
			var/turf/T = get_turf(src)
			T.visible_message("\icon[src] *beeps*.\"")


	attack_self(mob/user)
		if(!user)	return 0
		on = !on
		user << "<span class='notice'>You toogle [src] [on ? "on" : "off"] </span>"
		return 1
