/client/proc/spawn_by_ckey()
	set category = "Vyetnam"
	set name = "Spawn by ckey"

	var/player_ckey = input(usr, "Enter player ckey", "Spawn by ckey")

	if(!player_ckey)
		return

	var/client/player = 0
	for(var/client/C in world)
		if(player_ckey == player.ckey)
			player = C
			break

	if(!player)
		usr << "\red User not found."

	var/list/possible_equipment = list("Marine", "Sergeant", "Corporal", "Lieutenant")

	var/equipment = input(usr, "Select equipment", "Equipment") in possible_equipment

	if(!equipment || !player)
		return

	var/mob/new_player/newPlayer = new(usr.loc)
	newPlayer.client = player
	var/mob/living/carbon/human/M = newPlayer.create_character()

	switch(equipment)
		if("Marine")
			M.equip_to_slot_or_del(/obj/item/clothing/under/tactical, slot_w_uniform)
			M.equip_to_slot_or_del(/obj/item/clothing/shoes/slippers, slot_shoes)

		if("Sergeant")
			M.equip_to_slot_or_del(/obj/item/clothing/under/tactical, slot_w_uniform)
			M.equip_to_slot_or_del(/obj/item/clothing/head/helmet/tactical/nanotrasen/tactical, slot_head)
			M.equip_to_slot_or_del(/obj/item/weapon/melee/classic_baton, slot_belt)
			M.equip_to_slot_or_del(/obj/item/clothing/shoes/jackboots, slot_shoes)

		if("Corporal")
			M.equip_to_slot_or_del(/obj/item/clothing/under/tactical, slot_w_uniform)
			M.equip_to_slot_or_del(/obj/item/weapon/melee/classic_baton, slot_belt)
			M.equip_to_slot_or_del(/obj/item/clothing/shoes/jackboots, slot_shoes)

		//if("Lieutenant")
			//M.equip_to_slot_or_del(,)
			//M.equip_to_slot_or_del(,)
			//M.equip_to_slot_or_del(,)

	var/obj/item/weapon/card/id/W = new(M)
	W.name = "[M.real_name]'s ID Card"
	W.access = get_all_accesses()
	W.assignment = equipment
	W.registered_name = M.real_name
	M.equip_to_slot_or_del(W, slot_wear_id)