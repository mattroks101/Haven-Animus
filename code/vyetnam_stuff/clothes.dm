/obj/item/clothing/head/helmet/HoS/nkvd
	name = "NKVD cap"
	desc = "You will trembling in fear while look at this cap. Even you're NKVD officer."
	icon_state = "nkvdcap"
	armor = list(melee = 90, bullet = 80, laser = 60, energy = 10, bomb = 25, bio = 0, rad = 0)

/obj/item/clothing/suit/armor/hos/nkvd
	name = "NKVD coat"
	desc = "Soft and warm like as you needed."
	icon_state = "nkvdcoat"

/obj/item/clothing/suit/armor/maskcloak
	name = "maskcloak"
	desc = "Mm... Still fresh."
	icon_state = "maskcloak"
	armor = list(melee = 45, bullet = 30, laser = 30, energy = 10, bomb = 25, bio = 0, rad = 0)

/obj/item/clothing/head/soft/greenberets
	name = "maskcloak hood"
	desc = "Mm... Still fresh."
	icon_state = "maskhood"
	armor = list(melee = 45, bullet = 30, laser = 30, energy = 10, bomb = 25, bio = 0, rad = 0)

/obj/item/clothing/suit/armor/greenberets
	name = "greenberets armor"
	desc = "Not for green rookies."
	icon_state = "greenberets_armor"
	armor = list(melee = 70, bullet = 80, laser = 60, energy = 10, bomb = 25, bio = 0, rad = 0)

/obj/item/clothing/under/syndicate/greenberets
	name = "greenberets uniform"
	desc = "Just recolored syndicate uniform."
	icon_state = "greenberets"
	item_color = "greenberets"

/obj/item/clothing/under/syndicate/gook
	name = "gook castoff suit"
	desc = "Burns well in napalm."
	icon_state = "gookjumpsuit"
	item_color = "gookjumpsuit"
	var/trouser = 0

/obj/item/clothing/under/syndicate/gook/verb/toggle_sleeve()
	set name = "Roll up trouser"
	set category = "Object"
	set src in usr

	if(trouser)
		trouser = 0
		usr << "You roll up trouser"
		item_state +="_rolled"
	else
		trouser = 1
		usr << "You roll down trouser"
		item_state = initial(item_state)

	if(istype(loc, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = loc
		H.update_inv_w_uniform()

/obj/item/clothing/head/soft/gook
	name = "gook castoff cap"
	desc = "Do you like frisby?"
	icon_state = "vietnamesehat"

/obj/item/clothing/tie/holster/greenberets
	name = "Green holster"
	desc = "Useful to keep you green beret dry."
	icon_state = "vest_green"