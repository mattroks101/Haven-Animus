/datum/job/hos
	title = "Head of Security"
	flag = HOS
	department_head = list("Captain")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the captain"
	selection_color = "#ffdddd"
	idtype = /obj/item/weapon/card/id/hos
	access = list(access_security, access_sec_doors, access_brig, access_armory, access_court,
			            access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
			            access_research, access_engine, access_mining, access_medical, access_construction, access_mailsorting,
			            access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_armory, access_court,
			            access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
			            access_research, access_engine, access_mining, access_medical, access_construction, access_mailsorting,
			            access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway)
	minimal_player_age = 14

	implanted = 1
	uniform = /obj/item/clothing/under/rank/head_of_security
	pda = /obj/item/device/pda/heads/hos
	ear = /obj/item/device/radio/headset/heads/hos
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/black
	glasses = /obj/item/clothing/glasses/sunglasses/sechud

	put_in_backpack = list(\
		/obj/item/weapon/gun/energy/gun,\
		/obj/item/weapon/handcuffs,\
		/obj/item/weapon/gun/energy/gun,\
		/obj/item/device/flashlight/seclite
	)

	backpacks = list(
		/obj/item/weapon/storage/backpack/security,\
		/obj/item/weapon/storage/backpack/satchel_sec,\
		/obj/item/weapon/storage/backpack/satchel
	)



/datum/job/warden
	title = "Warden"
	flag = WARDEN
	department_head = list("Head of Security")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of security"
	selection_color = "#ffeeee"
	idtype = /obj/item/weapon/card/id/sec
	access = list(access_security, access_sec_doors, access_brig, access_armory, access_court, access_maint_tunnels, access_morgue)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_armory, access_court, access_maint_tunnels)
	minimal_player_age = 5

	implanted = 1
	uniform = /obj/item/clothing/under/rank/warden
	pda = /obj/item/device/pda/warden
	ear = /obj/item/device/radio/headset/headset_sec
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/black
	glasses = /obj/item/clothing/glasses/sunglasses/sechud
//	mask = /obj/item/clothing/mask/gas //Grab one from the armory you donk

	put_in_backpack = list(\
		/obj/item/device/flash,\
		/obj/item/weapon/handcuffs,\
		/obj/item/device/flashlight/seclite
	)

	backpacks = list(
		/obj/item/weapon/storage/backpack/security,\
		/obj/item/weapon/storage/backpack/satchel_sec,\
		/obj/item/weapon/storage/backpack/satchel
	)



/datum/job/detective
	title = "Detective"
	flag = DETECTIVE
	department_head = list("Head of Security")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of security"
	selection_color = "#ffeeee"
	idtype = /obj/item/weapon/card/id/det

	access = list(access_security, access_sec_doors, access_forensics_lockers, access_morgue, access_maint_tunnels, access_court, access_morgue)
	minimal_access = list(access_security, access_sec_doors, access_forensics_lockers, access_morgue, access_maint_tunnels, access_court, access_morgue)
	minimal_player_age = 3

	implanted = 1
	uniform = /obj/item/clothing/under/det
	pda = /obj/item/device/pda/detective
	ear = /obj/item/device/radio/headset/headset_sec
	shoes = /obj/item/clothing/shoes/brown
	suit = /obj/item/clothing/suit/storage/det_suit
	gloves = /obj/item/clothing/gloves/black
	hat = /obj/item/clothing/head/det_hat

	put_in_backpack = list(\
		/obj/item/weapon/flame/lighter/zippo,\
		/obj/item/weapon/storage/box/evidence,\
		/obj/item/device/detective_scanner,\
		/obj/item/device/flashlight/seclite
	)


/datum/job/officer
	title = "Security Officer"
	flag = OFFICER
	department_head = list("Head of Security")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 5
	spawn_positions = 5
	supervisors = "the head of security"
	selection_color = "#ffeeee"
	idtype = /obj/item/weapon/card/id/sec
	access = list(access_security, access_sec_doors, access_brig, access_court, access_maint_tunnels, access_morgue)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_court, access_maint_tunnels)
	minimal_player_age = 3

	uniform = /obj/item/clothing/under/rank/security
	pda = /obj/item/device/pda/security
	ear = /obj/item/device/radio/headset/headset_sec
	shoes = /obj/item/clothing/shoes/jackboots

	put_in_backpack = list(\
		/obj/item/weapon/handcuffs,\
		/obj/item/weapon/handcuffs,\
		/obj/item/device/flash,\
		/obj/item/device/flashlight/seclite
	)

	backpacks = list(
		/obj/item/weapon/storage/backpack/security,\
		/obj/item/weapon/storage/backpack/satchel_sec,\
		/obj/item/weapon/storage/backpack/satchel
	)

	equip(var/mob/living/carbon/human/H)
		if(!H) return 0
		assign_sec_to_department(H)
		..()

var/list/sec_departments = list("engineering", "supply", "medical", "science")

/datum/job/officer/proc/assign_sec_to_department(var/mob/living/carbon/human/H as mob)
	if(sec_departments.len)
		var/department = pick(sec_departments)
		sec_departments -= department
		switch(department)
			if("supply")
				H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/security/alternative/cargo(H), slot_w_uniform)
				H.equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_sec/department/supply(H), slot_l_ear)
				minimal_access += list(access_mailsorting, access_mining)
			if("engineering")
				H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/security/alternative/engine(H), slot_w_uniform)
				H.equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_sec/department/engi(H), slot_l_ear)
				minimal_access += list(access_construction, access_engine)
			if("medical")
				H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/security/alternative/med(H), slot_w_uniform)
				H.equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_sec/department/med(H), slot_l_ear)
				minimal_access += list(access_medical)
			if("science")
				H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/security/alternative/science(H), slot_w_uniform)
				H.equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_sec/department/sci(H), slot_l_ear)
				minimal_access += list(access_research, access_tox)
			else
				H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/security/alternative(H), slot_w_uniform)
				H.equip_to_slot_or_del(new /obj/item/device/radio/headset/headset_sec(H), slot_l_ear)


/obj/item/device/radio/headset/headset_sec/department/New()
	if(radio_controller)
		initialize()
	recalculateChannels()

/obj/item/device/radio/headset/headset_sec/department/engi
	keyslot1 = new /obj/item/device/encryptionkey/headset_sec
	keyslot2 = new /obj/item/device/encryptionkey/headset_eng

/obj/item/device/radio/headset/headset_sec/department/supply
	keyslot1 = new /obj/item/device/encryptionkey/headset_sec
	keyslot2 = new /obj/item/device/encryptionkey/headset_cargo

/obj/item/device/radio/headset/headset_sec/department/med
	keyslot1 = new /obj/item/device/encryptionkey/headset_sec
	keyslot2 = new /obj/item/device/encryptionkey/headset_med

/obj/item/device/radio/headset/headset_sec/department/sci
	keyslot1 = new /obj/item/device/encryptionkey/headset_sec
	keyslot2 = new /obj/item/device/encryptionkey/headset_sci

/obj/item/clothing/under/rank/security/alternative/cargo/New()
	attachTie(new /obj/item/clothing/tie/armband/cargo)

/obj/item/clothing/under/rank/security/alternative/engine/New()
	attachTie(new /obj/item/clothing/tie/armband/engine)

/obj/item/clothing/under/rank/security/alternative/science/New()
	attachTie(new /obj/item/clothing/tie/armband/science)

/obj/item/clothing/under/rank/security/alternative/med/New()
	attachTie(new /obj/item/clothing/tie/armband/med)