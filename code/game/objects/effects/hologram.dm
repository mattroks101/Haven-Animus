/obj/effect/hologram
	name = "hologram"
	icon = 'icons/mob/ai.dmi'
	icon_state = "holo1"
	layer = 4.1	// above human mob
	var/hologram_group = "default_group"

/obj/effect/hologram/New()
	..()
	hide()
	update_icon()

/obj/effect/hologram/proc/show()
	invisibility = 0
	SetLuminosity(1,1,2)

/obj/effect/hologram/hide()
	invisibility = 101
	SetLuminosity(0, 0, 0)

/obj/effect/hologram/proc/activate(on)
	if(on)
		show()
	else
		hide()

/obj/effect/hologram/update_icon()
	icon = getHologramIcon(icon(icon, icon_state)) // icon(icon(icon,iconicon))

/obj/effect/hologram/item
	icon = 'icons/obj/items.dmi'
	icon_state = "red_crowbar"

/obj/effect/hologram/storage
	icon = 'icons/obj/storage.dmi'
	icon_state = "blue"

/obj/effect/hologram/computer
	icon = 'icons/obj/computer.dmi'
	icon_state = "comm0"

/obj/effect/hologram/structure
	icon = 'icons/obj/structures.dmi'
	icon_state = "grille"

/obj/effect/hologram/object
	icon = 'icons/obj/objects.dmi'
	icon_state = "target_h"

/obj/effect/hologram/wall
	icon = 'icons/turf/walls.dmi'

/obj/effect/hologram/human
	icon = 'icons/mob/human.dmi'
	icon_state = "body_m_s"

/obj/effect/hologram/robot
	icon = 'icons/mob/robots.dmi'
	icon_state = "robot"
