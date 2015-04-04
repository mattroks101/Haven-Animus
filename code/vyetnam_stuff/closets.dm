/obj/structure/closet/gear/lieutenant
	name = "Lieutenant gear closet"

/obj/structure/closet/gear/lieutenant/New()
	..()
	/*Weapon*/
	new /obj/item/weapon/gun/projectile/automatic/pistol/usp(src)
	new /obj/item/ammo_magazine/external/sm45(src)
	new /obj/item/ammo_magazine/external/sm45(src)
	new /obj/item/ammo_magazine/external/sm45(src)

	/*Clothes*/
	new /obj/item/clothing/head/helmet/HoS/dermal(src)
	new /obj/item/clothing/suit/armor/bulletproof/nanotrasen(src)
	new /obj/item/weapon/storage/belt/security/tactical(src)

	var/obj/item/weapon/storage/backpack/satchel_norm/satchel = new(src)

	/*Other stuff*/
	new /obj/item/weapon/storage/box/first_aid_kit(satchel)
	new /obj/item/weapon/storage/box/lunches(satchel)
	new /obj/item/weapon/flame/lighter/zippo(src)
	new /obj/item/weapon/reagent_containers/food/drinks/flask/marine(src)


	new /obj/item/device/radio/headset/ert(src)



/obj/structure/closet/gear/sergeant
	name = "Sergeant gear closet"
	icon_state = "secoff"
	icon_opened = "secopen"
	icon_closed = "secoff"

/obj/structure/closet/gear/sergeant/New()
	..()
	/*Weapon*/
	new /obj/item/weapon/gun/projectile/automatic/pistol/vietnam/m14(src)
	for(var/i = 0; i < 4; i++)
		new /obj/item/ammo_magazine/external/mag762(src)
	new /obj/item/weapon/gun/projectile/automatic/pistol/m1911(src)
	new /obj/item/ammo_magazine/external/sm45(src)
	new /obj/item/ammo_magazine/external/sm45(src)

	/*Clothes*/
	new /obj/item/clothing/head/helmet/tactical/nanotrasen(src)
	new /obj/item/clothing/head/helmet/HoS/dermal(src)
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
	new /obj/item/weapon/reagent_containers/food/drinks/flask/marine(src)
	new /obj/item/weapon/kitchen/utensil/bayonet(src)
	new /obj/item/weapon/screwdriver(src)

	new /obj/item/device/radio/headset/ert(src)


/obj/structure/closet/gear/corporal
	name = "Corporal gear closet"
	icon_state = "capsecureoff"
	icon_opened = "capsecureopen"
	icon_closed = "capsecureoff"

/obj/structure/closet/gear/corporal/New()
	..()
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
	new /obj/item/weapon/reagent_containers/food/drinks/flask/marine(src)
	new /obj/item/weapon/kitchen/utensil/bayonet(src)
	new /obj/item/weapon/screwdriver(src)

	new /obj/item/device/radio/off(src)


/obj/structure/closet/gear/marine
	name = "Marine gear closet"

/obj/structure/closet/gear/marine/New()
	..()
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
	new /obj/item/weapon/reagent_containers/food/drinks/flask/marine(src)
	new /obj/item/weapon/kitchen/utensil/bayonet(src)
	new /obj/item/weapon/screwdriver(src)

	new /obj/item/device/radio/off(src)

/obj/structure/closet/gear/fire_support
	name = "Fire support gear closet"
	icon_state = "red"
	icon_opened = "open"
	icon_closed = "red"

/obj/structure/closet/gear/fire_support/New()
	..()
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
	new /obj/item/weapon/reagent_containers/food/drinks/flask/marine(src)
	new /obj/item/weapon/kitchen/utensil/bayonet(src)
	new /obj/item/weapon/screwdriver(src)

	new /obj/item/device/radio/off(src)


/obj/structure/closet/gear/medic
	name = "Medic gear closet"
	icon_state = "medicaloff"
	icon_opened = "medicalopen"
	icon_closed = "medicaloff"

/obj/structure/closet/gear/medic/New()
	..()
	/*Weapon*/
	new /obj/item/weapon/gun/projectile/automatic/vietnam/m3a1(src)
	for(var/i = 0; i < 3; i++)
		new /obj/item/ammo_magazine/external/m3a145(src)

	new /obj/item/weapon/gun/projectile/automatic/pistol/m1911(src)
	new /obj/item/ammo_magazine/external/sm45(src)
	new /obj/item/ammo_magazine/external/sm45(src)

	/*Clothes*/
	new /obj/item/clothing/head/helmet/tactical/nanotrasen (src)
	new /obj/item/clothing/suit/armor/bulletproof/nanotrasen (src)
	new /obj/item/clothing/shoes/jackboots (src)

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
	new /obj/item/weapon/reagent_containers/food/drinks/flask/marine(src)
	new /obj/item/weapon/kitchen/utensil/bayonet(src)
	new /obj/item/weapon/screwdriver(src)

	new /obj/item/device/radio/off(src)


/obj/structure/closet/gear/engineer
	name = "Engineer gear closet"
	icon_state = "toolcloset"
	icon_opened = "toolclosetopen"
	icon_closed = "toolcloset"

/obj/structure/closet/gear/engineer/New()
	..()
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
	new /obj/item/weapon/reagent_containers/food/drinks/flask/marine(src)
	new /obj/item/weapon/kitchen/utensil/bayonet(src)
	new /obj/item/weapon/screwdriver(src)

	new /obj/item/stack/sheet/metal(satchel)
	new /obj/item/stack/sheet/glass(satchel)

	new /obj/item/device/radio/off(src)

/obj/structure/closet/gear/spetsnaz_leader
	name = "Spetsnaz Leader gear"
	icon_state = "syndicate"
	icon_opened = "syndicateopen"
	icon_closed = "syndicate"

/obj/structure/closet/gear/spetsnaz_leader/New()
	..()

	new /obj/item/clothing/glasses/night(src)
	new /obj/item/clothing/shoes/jackboots(src)
	new /obj/item/clothing/under/syndicate/combat(src)
	new /obj/item/device/radio/headset/syndicate(src)
	new /obj/item/weapon/storage/backpack/satchel_norm(src)
	new /obj/item/weapon/gun/projectile/automatic/pistol/stechtkin(src)
	new /obj/item/ammo_magazine/external/mc9mm(src)
	new /obj/item/ammo_magazine/external/mc9mm(src)
	new /obj/item/weapon/storage/belt/military(src)
	new /obj/item/weapon/reagent_containers/hypospray/combat(src)
	new /obj/item/clothing/suit/armor/vest(src)
	new /obj/item/clothing/head/helmet/HoS/dermal(src)

/obj/structure/closet/gear/spetsnaz_interrogator
	name = "Spetsnaz Interrogator gear"
	icon_state = "acloset"
	icon_opened = "aclosetopen"
	icon_closed = "acloset"

/obj/structure/closet/gear/interrogator/New()
	..()

	new /obj/item/clothing/glasses/night(src)
	new /obj/item/clothing/shoes/laceup(src)
	new /obj/item/clothing/under/det/slob(src)
	new /obj/item/clothing/glasses/sunglasses/aviator(src)
	new /obj/item/clothing/gloves/black(src)
	new /obj/item/clothing/head/helmet/HoS/nkvd(src)
	new /obj/item/clothing/suit/armor/hos/nkvd(src)
	new /obj/item/weapon/storage/backpack/satchel(src)
	new /obj/item/device/radio/headset/syndicate(src)
	new /obj/item/weapon/gun/projectile/revolver(src)
	new /obj/item/clothing/tie/holster(src)
	new /obj/item/ammo_magazine/box/a357(src)
	new /obj/item/ammo_magazine/box/a357(src)

/obj/structure/closet/gear/spetsnaz_engineer
	name = "Spetsnaz Engineer gear"
	icon_state = "secureengweldoff"
	icon_opened = "toolclosetopen"
	icon_closed = "secureengweldoff"

/obj/structure/closet/gear/spetsnaz_engineer/New()
	..()
	new /obj/item/clothing/glasses/night(src)
	new /obj/item/clothing/shoes/jackboots(src)
	new /obj/item/device/radio/headset/syndicate(src)
	new /obj/item/clothing/under/tactical(src)
	new /obj/item/weapon/storage/backpack/industrial(src)
	new /obj/item/weapon/plastique(src)
	new /obj/item/weapon/plastique(src)
	new /obj/item/weapon/mine/extra/(src)
	new /obj/item/weapon/mine/extra/(src)
	new /obj/item/weapon/gun/projectile/automatic/vietnam/rpk(src)
	new /obj/item/ammo_magazine/external/rpk(src)
	new /obj/item/ammo_magazine/external/rpk(src)
	new /obj/item/clothing/head/bomb_hood(src)
	new /obj/item/clothing/suit/bomb_suit(src)
	new /obj/item/weapon/storage/toolbox/mechanical(src)
	new /obj/item/weapon/storage/backpack/satchel_norm(src)

/obj/structure/closet/gear/spetsnaz_recon
	name = "Spetsnaz Recon gear"
	icon_state = "rdsecureoff"
	icon_opened = "rdsecureopen"
	icon_closed = "rdsecureoff"

/obj/structure/closet/gear/spetsnaz_recon/New()
	..()
	new /obj/item/clothing/glasses/night(src)
	new /obj/item/device/radio/headset/syndicate(src)
	new /obj/item/clothing/under/tactical(src)
	new /obj/item/clothing/shoes/jackboots(src)
	new /obj/item/clothing/suit/armor/maskcloak(src)
	new /obj/item/clothing/head/soft/gook(src)
	new /obj/item/clothing/glasses/thermal/monocle(src)
	new /obj/item/weapon/legcuffs/beartrap(src)
	new /obj/item/weapon/legcuffs/beartrap(src)
	new /obj/item/weapon/storage/backpack/satchel_norm(src)
	new /obj/item/weapon/grenade/smokebomb(src)
	new /obj/item/weapon/grenade/smokebomb(src)
	new /obj/item/weapon/grenade/smokebomb(src)
	new /obj/item/weapon/grenade/smokebomb(src)
	new /obj/item/weapon/grenade/chem_grenade/metalfoam(src)
	new /obj/item/weapon/gun/projectile/automatic/pistol/silenced/usp(src)
	new /obj/item/ammo_magazine/external/sm45(src)
	new /obj/item/ammo_magazine/external/sm45(src)

/obj/structure/closet/gear/spetsnaz_instructor
	name = "Spetsnaz Instructor gear"
	icon_state = "fridgebroken"
	icon_opened = "fridgeopen"
	icon_closed = "fridgebroken"

/obj/structure/closet/gear/spetsnaz_instructor/New()
	..()
	new /obj/item/clothing/glasses/night(src)
	new /obj/item/device/radio/headset/syndicate(src)
	new /obj/item/clothing/head/ushanka(src)
	new /obj/item/clothing/suit/armor/bulletproof(src)
	new /obj/item/weapon/gun/projectile/automatic/ak74u(src)
	new /obj/item/ammo_magazine/external/mag545(src)
	new /obj/item/ammo_magazine/external/mag545(src)
	new /obj/item/clothing/glasses/sunglasses/aviator(src)
	new /obj/item/weapon/storage/backpack/satchel(src)
	new /obj/item/clothing/under/soviet(src)
	new /obj/item/clothing/shoes/jackboots(src)