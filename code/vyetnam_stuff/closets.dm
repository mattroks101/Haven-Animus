/obj/structure/closet/gear/lieutenant
	name = "Lieutenant gear closet"

/obj/structure/closet/gear/lieutenant/New()
	name = "Lieutenant gear closet"


/obj/structure/closet/gear/sergeant
	name = "Sergeant gear closet"
	icon_state = "secoff"
	icon_opened = "secopen"
	icon_closed = "secoff"

/obj/structure/closet/gear/sergeant/New()
	/*Weapon*/
	new /obj/item/weapon/gun/projectile/automatic/pistol/vietnam/m14(src)
	for(var/i = 0; i < 4; i++)
		new /obj/item/ammo_magazine/external/mag762(src)
	new /obj/item/weapon/gun/projectile/automatic/pistol/m1911(src)
	new /obj/item/ammo_magazine/external/sm45(src)
	new /obj/item/ammo_magazine/external/sm45(src)

	/*Clothes*/
	new /obj/item/clothing/head/helmet/tactical/nanotrasen(src)
	new /obj/item/clothing/suit/armor/bulletproof/nanotrasen(src)
	//new /obj/item/clothing/shoes/jackboots(src)
	new /obj/item/weapon/storage/belt/security/tactical(src)

	var/obj/item/weapon/storage/backpack/satchel_norm/satchel = new(src)

	/*Other stuff*/
	new /obj/item/weapon/storage/box/first_aid_kit(satchel)
	new /obj/item/weapon/storage/box/medipens/utility(satchel)
	new /obj/item/weapon/storage/firstaid/regular(satchel)
	new /obj/item/weapon/grenade/syndieminibomb/nanotrasen(satchel)
	new /obj/item/weapon/grenade/syndieminibomb/nanotrasen(satchel)
	new /obj/item/weapon/storage/box/lunches(satchel)

	new /obj/item/device/radio/off(src)
	new /obj/item/device/radio/headset/ert(src)


/obj/structure/closet/gear/corporal
	name = "Corporal gear closet"
	icon_state = "capsecureoff"
	icon_opened = "capsecureopen"
	icon_closed = "capsecureoff"

/obj/structure/closet/gear/corporal/New()
	/*Weapon*/
	new /obj/item/weapon/gun/projectile/automatic/pistol/vietnam/m14(src)
	for(var/i = 0; i < 4; i++)
		new /obj/item/ammo_magazine/external/mag762(src)
	new /obj/item/weapon/gun/projectile/automatic/pistol/m1911(src)
	new /obj/item/ammo_magazine/external/sm45(src)
	new /obj/item/ammo_magazine/external/sm45(src)

	/*Clothes*/
	new /obj/item/clothing/head/helmet/tactical/nanotrasen(src)
	new /obj/item/clothing/suit/armor/bulletproof/nanotrasen(src)
	//new /obj/item/clothing/shoes/jackboots(src)
	new /obj/item/weapon/storage/belt/security/tactical(src)

	var/obj/item/weapon/storage/backpack/satchel_norm/satchel = new(src)

	/*Other stuff*/
	new /obj/item/weapon/storage/box/medipens/utility(satchel)
	new /obj/item/weapon/storage/box/first_aid_kit(satchel)
	new /obj/item/weapon/storage/firstaid/regular(satchel)
	new /obj/item/weapon/grenade/syndieminibomb/nanotrasen(satchel)
	new /obj/item/weapon/grenade/syndieminibomb/nanotrasen(satchel)
	new /obj/item/weapon/storage/box/lunches(satchel)

	new /obj/item/device/radio/off(src)


/obj/structure/closet/gear/marine
	name = "Marine gear closet"

/obj/structure/closet/gear/marine/New()
	/*Weapon*/
	new /obj/item/weapon/gun/projectile/automatic/pistol/vietnam/m14(src)
	for(var/i = 0; i < 4; i++)
		new /obj/item/ammo_magazine/external/mag762(src)

	/*Clothes*/
	new /obj/item/clothing/head/helmet/tactical/nanotrasen(src)
	new /obj/item/clothing/suit/armor/bulletproof/nanotrasen(src)
	new /obj/item/clothing/shoes/jackboots(src)
	new /obj/item/weapon/storage/belt/security/tactical(src)

	var/obj/item/weapon/storage/backpack/satchel_norm/satchel = new(src)

	/*Other stuff*/
	new /obj/item/weapon/storage/box/first_aid_kit(satchel)
	new /obj/item/weapon/grenade/syndieminibomb/nanotrasen(satchel)
	new /obj/item/weapon/grenade/syndieminibomb/nanotrasen(satchel)
	new /obj/item/weapon/storage/box/lunches(satchel)

/obj/structure/closet/gear/fire_support
	name = "Fire support gear closet"
	icon_state = "red"
	icon_opened = "open"
	icon_closed = "red"

/obj/structure/closet/gear/fire_support/New()
	/*Weapon*/
	new /obj/item/weapon/gun/projectile/automatic/vietnam/m60(src)
	for(var/i = 0; i < 3; i++)
		new /obj/item/ammo_magazine/external/m60e1(src)

	/*Clothes*/
	new /obj/item/clothing/head/helmet/tactical/nanotrasen(src)
	new /obj/item/clothing/suit/armor/bulletproof/nanotrasen(src)
	new /obj/item/clothing/shoes/jackboots(src)
	new /obj/item/weapon/storage/belt/security/tactical(src)

	var/obj/item/weapon/storage/backpack/satchel_norm/satchel = new(src)

	/*Other stuff*/
	new /obj/item/weapon/storage/box/first_aid_kit(satchel)

	new /obj/item/weapon/grenade/syndieminibomb/nanotrasen(satchel)
	new /obj/item/weapon/grenade/syndieminibomb/nanotrasen(satchel)
	new /obj/item/weapon/storage/box/lunches(satchel)
	new /obj/item/weapon/storage/box/explosive_kit(satchel)
	new /obj/item/device/radio/off(src)


/obj/structure/closet/gear/medic
	name = "Medic gear closet"
	icon_state = "medicaloff"
	icon_opened = "medicalopen"
	icon_closed = "medicaloff"

/obj/structure/closet/gear/medic/New()
	/*Weapon*/
	new /obj/item/weapon/gun/projectile/automatic/vietnam/m3a1(src)
	for(var/i = 0; i < 3; i++)
		new /obj/item/ammo_magazine/external/m3a145(src)

	new /obj/item/weapon/gun/projectile/automatic/pistol/m1911(src)
	new /obj/item/ammo_magazine/external/sm45(src)
	new /obj/item/ammo_magazine/external/sm45(src)

	/*Clothes*/
	new /obj/item/clothing/head/helmet/tactical/nanotrasen
	new /obj/item/clothing/suit/armor/bulletproof/nanotrasen
	new /obj/item/clothing/shoes/jackboots

	var/obj/item/weapon/storage/belt/medical/belt = new(src)
	var/obj/item/weapon/storage/backpack/satchel_med/satchel = new(src)

	/*Other stuff*/
	new /obj/item/weapon/storage/box/first_aid_kit(satchel)
	new /obj/item/weapon/storage/firstaid/adv(satchel)

	new /obj/item/weapon/storage/pill_bottle/epinephrine(belt)
	new /obj/item/weapon/reagent_containers/glass/bottle/morphine(belt)
	new /obj/item/weapon/reagent_containers/glass/bottle/morphine(belt)
	new /obj/item/weapon/reagent_containers/glass/bottle/morphine(belt)
	new /obj/item/weapon/reagent_containers/glass/bottle/salglu_solution(belt)
	new /obj/item/weapon/reagent_containers/glass/bottle/salglu_solution(belt)


	new /obj/item/weapon/storage/surgery_tools_case(src)
	new /obj/item/roller(src)
	new /obj/item/weapon/storage/box/syringes (satchel)
	new /obj/item/weapon/grenade/syndieminibomb/nanotrasen(satchel)
	new /obj/item/weapon/grenade/syndieminibomb/nanotrasen(satchel)
	new /obj/item/weapon/storage/box/lunches(satchel)


/obj/structure/closet/gear/engineer
	name = "Engineer gear closet"
	icon_state = "toolcloset"
	icon_opened = "toolclosetopen"
	icon_closed = "toolcloset"

/obj/structure/closet/gear/engineer/New()
	/*Weapon*/
	new /obj/item/weapon/gun/projectile/shotgun(src)
	new /obj/item/ammo_magazine/box/shotgun (src)
	new /obj/item/ammo_magazine/box/shotgun (src)
	new /obj/item/ammo_magazine/box/shotgun/bean(src)

	/*Clothes*/
	new /obj/item/clothing/head/helmet/tactical/nanotrasen(src)
	new /obj/item/clothing/suit/armor/bulletproof/nanotrasen(src)
	new /obj/item/clothing/shoes/jackboots(src)
	new /obj/item/weapon/storage/belt/security/tactical(src)
	new /obj/item/weapon/storage/belt/utility/full(src)
	new /obj/item/clothing/gloves/yellow(src)
	var/obj/item/weapon/storage/backpack/industrial/satchel = new(src)

	/*Other stuff*/
	new /obj/item/weapon/storage/box/first_aid_kit(satchel)

	new /obj/item/weapon/grenade/syndieminibomb/nanotrasen(satchel)
	new /obj/item/weapon/grenade/syndieminibomb/nanotrasen(satchel)
	new /obj/item/weapon/storage/box/lunches(satchel)

	new /obj/item/stack/sheet/metal(satchel)
	new /obj/item/stack/sheet/glass(satchel)