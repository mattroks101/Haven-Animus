/obj/item/clothing/head/helmet
	name = "helmet"
	desc = "Standard Security gear. Protects the head from impacts."
	icon_state = "helmet"
	flags = FPRINT | TABLEPASS | HEADCOVERSEYES
	item_state = "helmet"
	armor = list(melee = 50, bullet = 15, laser = 50,energy = 10, bomb = 25, bio = 0, rad = 0)
	flags_inv = HIDEEARS|HIDEEYES
	cold_protection = HEAD
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = HEAD
	max_heat_protection_temperature = HELMET_MAX_HEAT_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.7
	var/obj/machinery/camera/camera
	var/network_used = "SS13"


/obj/item/clothing/head/helmet/emp_act(severity)
	if(network_used)
		if(1.0)
			if(src.camera)
				src.camera.network = list()
				cameranet.removeCamera(src.camera)
				usr << "<span class='warning'>[src.name] bzzz.</span>"
	else ..()



/obj/item/clothing/head/helmet/attack_self(mob/user)
	if(network_used)
		if(camera)
			..(user)
		else
			camera = new /obj/machinery/camera(src)
			camera.network = list(network_used)
			cameranet.removeCamera(camera)
			camera.c_tag = user.name
			user << "\blue User scanned as [camera.c_tag]. Camera activated."
	else ..()


/obj/item/clothing/head/helmet/warden
	name = "warden's hat"
	desc = "It's a special helmet issued to the Warden of a securiy force. Protects the head from impacts."
	icon_state = "policehelm"
	flags_inv = 0

/obj/item/clothing/head/helmet/riot
	name = "riot helmet"
	desc = "It's a helmet specifically designed to protect against close range attacks."
	icon_state = "riot"
	item_state = "helmet"
	flags = FPRINT|TABLEPASS|HEADCOVERSEYES
	armor = list(melee = 82, bullet = 15, laser = 5,energy = 5, bomb = 5, bio = 2, rad = 0)
	flags_inv = HIDEEARS
	siemens_coefficient = 0.7

/obj/item/clothing/head/helmet/swat
	name = "\improper SWAT helmet"
	desc = "They're often used by highly trained Swat Members."
	icon_state = "swat"
	flags = FPRINT | TABLEPASS | HEADCOVERSEYES
	item_state = "swat"
	armor = list(melee = 80, bullet = 60, laser = 50,energy = 25, bomb = 50, bio = 10, rad = 0)
	flags_inv = HIDEEARS|HIDEEYES
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.5
	network_used = "swat"

/obj/item/clothing/head/helmet/thunderdome
	name = "\improper Thunderdome helmet"
	desc = "<i>'Let the battle commence!'</i>"
	icon_state = "thunderdome"
	flags = FPRINT | TABLEPASS | HEADCOVERSEYES
	item_state = "thunderdome"
	armor = list(melee = 80, bullet = 60, laser = 50,energy = 10, bomb = 25, bio = 10, rad = 0)
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 1
	network_used = "thunder"

/obj/item/clothing/head/helmet/gladiator
	name = "gladiator helmet"
	desc = "Ave, Imperator, morituri te salutant."
	icon_state = "gladiator"
	flags = FPRINT|TABLEPASS|HEADCOVERSEYES|HEADCOVERSMOUTH|BLOCKHAIR
	item_state = "gladiator"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES
	siemens_coefficient = 1
	network_used = "thunder"

/obj/item/clothing/head/helmet/tactical
	name = "tactical helmet"
	desc = "An armored helmet capable of being fitted with a multitude of attachments."
	icon_state = "swathelm"
	item_state = "helmet"
	flags = FPRINT|TABLEPASS|HEADCOVERSEYES
	armor = list(melee = 62, bullet = 50, laser = 50,energy = 35, bomb = 10, bio = 2, rad = 0)
	flags_inv = HIDEEARS
	siemens_coefficient = 0.7
	network_used = "swat"





/// HUD HELMETS


/obj/item/clothing/head/helmet/hud
	name = "hud helmet"
	var/broken = 0


	proc
		process_hud(var/mob/M)	return


/obj/item/clothing/head/helmet/hud/iron_hammer
	name = "iron hammer helmet"
	desc = "Helmet of special forces Iron Hammer"
	flags = FPRINT | TABLEPASS | HEADCOVERSEYES
	armor = list(melee = 80, bullet = 40, laser = 60,energy = 25, bomb = 50, bio = 10, rad = 0)
	flags_inv = HIDEEARS|HIDEEYES
	siemens_coefficient = 0.7


	process_hud(mob/M)

		if(!M || !M.client || src.broken)	return
		var/client/C = M.client
		var/image/holder
		var/alert_level = 0
		for(var/mob/living/carbon/human/suspiciou_person in view(get_turf(M)))
			if(M.see_invisible < suspiciou_person.invisibility)
				continue
			if(suspiciou_person.wear_id )
				var/obj/item/weapon/card/id/CARTA_ID = suspiciou_person.wear_id.GetID()
				if(1 in CARTA_ID.access)
					continue


			var/list/all_items = suspiciou_person.get_contents()

			for(var/obj/I in all_items)
				world << I.type
				if(findtext(I.type, "obj/item/weapon/gun"))
					world << "EEEEEEE FOUND GUN"
			/*
				if(istype(I, /obj/item/device/jamming_tool))
					world << "found breaker! in [suspiciou_person]"
					break


				else if(istype(I, /obj/item/weapon/gun) || initial(I.name) in wanted_items)
					world << "found gun [I] in [suspiciou_person]"
					alert_level+=1
*/

			if(istype(suspiciou_person.l_hand, /obj/item/weapon/gun) || istype(suspiciou_person.l_hand, /obj/item/weapon/melee))
				if(!istype(suspiciou_person.l_hand, /obj/item/weapon/gun/energy/laser/bluetag || /obj/item/weapon/gun/energy/laser/redtag || /obj/item/weapon/gun/energy/laser/practice))
					alert_level+=1
			if(istype(suspiciou_person.r_hand, /obj/item/weapon/gun) || istype(suspiciou_person.l_hand, /obj/item/weapon/melee))
				if(!istype(suspiciou_person.r_hand, /obj/item/weapon/gun/energy/laser/bluetag || /obj/item/weapon/gun/energy/laser/redtag || /obj/item/weapon/gun/energy/laser/practice))
					alert_level+=1
			if(istype(suspiciou_person:belt, /obj/item/weapon/gun) || istype(suspiciou_person.l_hand, /obj/item/weapon/melee))
				if(!istype(suspiciou_person:belt, /obj/item/weapon/gun/energy/laser/bluetag || /obj/item/weapon/gun/energy/laser/redtag || /obj/item/weapon/gun/energy/laser/practice))
					alert_level+=1

			holder = suspiciou_person.hud_list[ALERT_HUD]

			if(alert_level > 0)
				holder.icon_state = "hudalert"
			else
				holder.icon_state = null
			C.images += holder
		return 1


/obj/item/clothing/head/helmet/hud/emp_act(severity)
	..()
	broken = 1
	desc+="\n It's broken!"


var/list/wanted_items = list()