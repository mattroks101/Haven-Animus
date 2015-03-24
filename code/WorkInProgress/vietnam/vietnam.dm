/obj/item/weapon/gun/projectile/automatic/pistol/vietnam/akm
	name = "AKM"
	desc = "A replica of Russian military rifle from 20 century"
	icon = 'icons/obj/gun.dmi'
	icon_state = "AKM"
	item_state = "c20r"
	w_class = 3.0
	origin_tech = "combat=5;materials=3"
	mag_type = /obj/item/ammo_magazine/external/mag545
	fire_sound = 'sound/weapons/Gunshot_smg.ogg'


/obj/item/weapon/gun/projectile/automatic/pistol/vietnam/sks
	name = "SKS"
	desc = "A New Russia Military rifle. Also using by Syndicate"
	icon_state = "SKS"
	w_class = 3.0
	origin_tech = "combat=2;materials=2;syndicate=5"
	fire_sound = 'sound/weapons/Gunshot_smg.ogg'
	mag_type = /obj/item/ammo_magazine/external/mag545sks


/obj/item/ammo_magazine/external/mag545sks
	name = "magazine (5.45)"
	icon = 'icons/obj/ammo.dmi'
	icon_state = "545magsks"
	ammo_type = /obj/item/ammo_casing/mag545
	caliber = "5.45"
	max_ammo = 10


/obj/item/weapon/gun/projectile/automatic/pistol/m14
	name = "M14"
	desc = "Nanotrasen ground infantry standard weapon"
	icon = 'icons/obj/gun.dmi'
	icon_state = "M14"
	item_state = "c20r"
	w_class = 3.0
	origin_tech = "combat=5;materials=3"
	mag_type = /obj/item/ammo_magazine/external/mag545
	fire_sound = 'sound/weapons/Gunshot.ogg'
	var/obj/item/weapon/kitchen/utensil/knife = 0
	var/open = 0

/obj/item/ammo_magazine/external/vietnam/mag762
	name = "magazine (7.62)"
	icon = 'icons/obj/ammo.dmi'
	icon_state = "7.62"
	ammo_type = /obj/item/ammo_casing/ammo762
	caliber = "7.62"
	max_ammo = 20

/obj/item/ammo_casing/ammo762
	desc = "A 7.62 bullet casing."
	caliber = "7.62"
	projectile_type = /obj/item/projectile/bullet

/obj/item/weapon/gun/projectile/automatic/pistol/vietnam/m3a1
	name = "M3A1"
	desc = "M3A1 Grease Gun, nanotrasen ground infantry medics standard weapon"
	icon = 'icons/obj/gun.dmi'
	icon_state = "greasegun"
	item_state = "c20r"
	w_class = 3.0
	origin_tech = "combat=5;materials=3"
	mag_type = /obj/item/ammo_magazine/external/m3a145
	fire_sound = 'sound/weapons/Gunshot_smg.ogg'

/obj/item/ammo_magazine/external/m3a145
	name = "magazine (.45)"
	icon = 'icons/obj/ammo.dmi'
	icon_state = ".45greasegun"
	ammo_type = /obj/item/ammo_casing/c45
	caliber = ".45"
	max_ammo = 30

/obj/item/weapon/gun/projectile/automatic/pistol/vietnam/mp40
	name = "MP40"
	desc = "MP40, a replica of the Nazi army standard weapon"
	icon = 'icons/obj/gun.dmi'
	icon_state = "MP40"
	item_state = "c20r"
	w_class = 3.0
	origin_tech = "combat=5;materials=3"
	mag_type = /obj/item/ammo_magazine/external/mp40919
	fire_sound = 'sound/weapons/Gunshot_smg.ogg'

/obj/item/ammo_magazine/external/mp40919
	name = "magazine (9x19)"
	icon = 'icons/obj/ammo.dmi'
	icon_state = "9x19mp40"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = "9mm"
	max_ammo = 32

/obj/item/weapon/gun/projectile/automatic/pistol/vietnam/m60
	name = "M60"
	desc = "M60E1, a Nanotrasen ground forces LMG"
	icon = 'icons/obj/gun.dmi'
	icon_state = "m60"
	item_state = "c20r"
	w_class = 3.0
	origin_tech = "combat=5;materials=3"
	mag_type = /obj/item/ammo_magazine/external/m60e3
	fire_sound = 'sound/weapons/Gunshot.ogg'

/obj/item/ammo_magazine/external/m60e3
	name = "magazine (7.62)"
	icon = 'icons/obj/ammo.dmi'
	icon_state = "m60e3ammo"
	ammo_type = /obj/item/ammo_casing/ammo762
	caliber = "7.62"
	max_ammo = 75

/obj/item/weapon/gun/projectile/automatic/pistol/vietnam/m1911
	name = "M1911"
	desc = "M911, a Nanotrasen ground forces pistol"
	icon = 'icons/obj/gun.dmi'
	icon_state = "colt1911"
	item_state = "gun"
	w_class = 2.0
	origin_tech = "combat=5;materials=3"
	mag_type = /obj/item/ammo_magazine/external/sm45
	fire_sound = 'sound/weapons/Gunshot_m9.ogg'

/obj/item/weapon/gun/projectile/automatic/pistol/m14/update_icon()
	if(magazine)
		icon_state = "M14"
		if(knife)
			icon_state = "M14-k"
	else
		icon_state = "M14-e"
		if(knife)
			icon_state = "M14-e-k"

/obj/item/weapon/gun/projectile/automatic/pistol/m14/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/screwdriver))
		if(open)
			usr << "You Tighten the screws on [src]."
			open = 0
		else
			usr << "You unscrewed the bolts on [src]."
			open = 1

	if(istype(W, /obj/item/weapon/kitchen/utensil) && open)
		knife = W
		user.drop_item()
		W.loc = src
		src.force = W.force
		user << "<span class='notice'>You add [knife] to \the [src]!</span>"
		update_icon()
	..()

/obj/item/weapon/gun/projectile/automatic/pistol/m14/afterattack(mob/user as mob)
	..()
	if(knife && open)
		knife.loc = get_turf(src.loc)
		src.knife = null
		usr << "\red Bayonet fell off from [src]"
	update_icon()
	return

/obj/item/weapon/gun/projectile/automatic/pistol/vietnam/afterattack(mob/user as mob)
	..()
	update_icon()
	return


/obj/item/weapon/gun/projectile/automatic/pistol/vietnam/update_icon()
	if(magazine)
		icon_state = initial(icon_state)
	else
		icon_state = initial(icon_state) + "-e"
