//Regular syndicate space suit
/obj/item/clothing/head/helmet/space/syndicate
	name = "red space helmet"
	desc = "Top secret Spess Helmet."
	icon_state = "syndicate"
	item_state = "syndicate"
	desc = "Has a tag: Totally not property of an enemy corporation, honest."
	armor = list(melee = 60, bullet = 50, laser = 30,energy = 15, bomb = 30, bio = 30, rad = 30)
	siemens_coefficient = 0.8

/obj/item/clothing/suit/space/syndicate
	name = "red space suit"
	icon_state = "syndicate"
	item_state = "space_suit_syndicate"
	desc = "Has a tag on it: Totally not property of of a hostile corporation, honest!"
	w_class = 3
	allowed = list(/obj/item/weapon/gun,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/weapon/melee/baton,/obj/item/weapon/melee/energy/sword,/obj/item/weapon/handcuffs,/obj/item/weapon/tank/emergency_oxygen)
	slowdown = 1
	armor = list(melee = 60, bullet = 50, laser = 30,energy = 15, bomb = 30, bio = 30, rad = 30)
	siemens_coefficient = 0.8

/obj/item/clothing/head/helmet/space/rig/syndi/human
	icon_state = "rig0-syndie-human"
	item_state = "syndie_helm"
	item_color = "syndie-human"
	species_restricted = list("Human")

/obj/item/clothing/suit/space/rig/syndi/human
	item_state = "syndie_hardsuit"
	icon_state = "rig-syndie-human"
	species_restricted = list("Human")
