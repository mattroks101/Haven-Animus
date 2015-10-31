// Ammo

/datum/design/shotgun_slug
	name = "Shotgun slug"
	id = "shotgun_slug"
	build_type = AMMOLATHE
	materials = list("$metal" = 4000)
	build_path = /obj/item/ammo_casing/shotgun
	category = list("Shotgun")

/datum/design/beanbag_slug
	name = "Beanbag slug"
	id = "beanbag_slug"
	build_type = AMMOLATHE
	materials = list("$metal" = 250)
	build_path = /obj/item/ammo_casing/shotgun/beanbag
	category = list("Shotgun")

/datum/design/shotgun_dart
	name = "Shotgun dart"
	id = "shotgun_dart"
	build_type = AMMOLATHE
	materials = list("$metal" = 4000)
	build_path = /obj/item/ammo_casing/shotgun/dart
	category = list("Shotgun")

/datum/design/a357
	name = "Combat"
	id = "a357"
	build_type = AMMOLATHE
	materials = list("$metal" = 500)
	build_path = /obj/item/ammo_casing/a357
	category = list(".357")

/datum/design/a357box
	name = "Combat (box)"
	id = "a357box"
	build_type = AMMOLATHE
	materials = list("$metal" = 3500)
	build_path = /obj/item/ammo_magazine/ammo_box/a357
	category = list(".357")

/datum/design/c45
	name = "Combat"
	id = "c45"
	build_type = AMMOLATHE
	materials = list("$metal" = 500)
	build_path = /obj/item/ammo_casing/c45
	category = list(".45")

/datum/design/c45rub
	name = "Rubber"
	id = "c45rub"
	build_type = AMMOLATHE
	materials = list("$metal" = 200, "$silver" = 50, "$plasma" = 10)
	build_path = /obj/item/ammo_casing/c45rub
	category = list(".45")

/datum/design/mag556
	name = "Combat"
	id = "mag556"
	build_type = AMMOLATHE
	materials = list("$metal" = 500)
	build_path = /obj/item/ammo_casing/mag556
	category = list("5.56")

/datum/design/mag556rub
	name = "Rubber"
	id = "mag556rub"
	build_type = AMMOLATHE
	materials = list("$metal" = 200, "$silver" = 50, "$plasma" = 10)
	build_path = /obj/item/ammo_casing/mag556rub
	category = list("5.56")

// High-tech ammo

/datum/design/ammo_9mm
	name = "SMG Magazine (9mm)"
	desc = "A box of prototype 9mm ammunition."
	id = "ammo_9mm"
	req_tech = list("combat" = 4, "materials" = 3)
	build_type = PROTOLATHE
	materials = list("$metal" = 3750, "$silver" = 100)
	build_path = /obj/item/ammo_magazine/external/msmg9mm

/datum/design/stunshell
	name = "Stun Shell"
	desc = "A stunning shell for a shotgun."
	id = "stunshell"
	req_tech = list("combat" = 3, "materials" = 3)
	build_type = PROTOLATHE
	materials = list("$metal" = 4000)
	build_path = /obj/item/ammo_casing/shotgun/stunshell