/client/proc/spawn_by_ckey()
	set category = "Vyetnam"
	set name = "Spawn by ckey"

	var/player_ckey = input(usr, "Enter player ckey", "Spawn by ckey")

	if(!player_ckey)
		return

	var/client/player = null
	for(var/client/C)
		if(player_ckey == C.key)
			player = C
			break

	if(!player)
		usr << "\red User not found."
		return

	var/list/possible_equipment = list("Marine/Fire Support/Medic/Engineer", "Sergeant", "Corporal", "Lieutenant")

	var/equipment = input(usr, "Select equipment", "Equipment") in possible_equipment

	if(!equipment || !player)
		return

	var/mob/new_player/newPlayer = new(usr.loc)
	newPlayer.client = player
	var/mob/living/carbon/human/M = newPlayer.create_character()
	M.loc = usr.loc

	switch(equipment)
		if("Marine")
			M.equip_to_slot_or_del(new /obj/item/clothing/under/tactical(M), slot_w_uniform)
			M.equip_to_slot_or_del(new /obj/item/clothing/shoes/slippers(M), slot_shoes)

		if("Sergeant")
			M.equip_to_slot_or_del(new /obj/item/clothing/under/tactical(M), slot_w_uniform)
			M.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/tactical/nanotrasen/tactical(M), slot_head)
			M.equip_to_slot_or_del(new /obj/item/weapon/melee/classic_baton(M), slot_belt)
			M.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(M), slot_shoes)

		if("Corporal")
			M.equip_to_slot_or_del(new /obj/item/clothing/under/tactical(M), slot_w_uniform)
			M.equip_to_slot_or_del(new /obj/item/weapon/melee/classic_baton(M), slot_belt)
			M.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(M), slot_shoes)

		if("Lieutenant")
			M.equip_to_slot_or_del(new /obj/item/clothing/under/syndicate(M), slot_w_uniform)
			M.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(M), slot_shoes)

	var/obj/item/weapon/card/id/W = new(M)
	W.name = "[M.real_name]'s ID Card"
	W.access = get_all_accesses()
	W.assignment = equipment
	W.registered_name = M.real_name
	M.equip_to_slot_or_del(W, slot_wear_id)