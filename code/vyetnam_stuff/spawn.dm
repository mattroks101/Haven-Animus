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

	var/list/possible_equipment = list("Marine", "Sergeant")

	var/equipment = input(usr, "Select equipment", "Equipment") in possible_equipment as anything|null

	if(!equipment || !player)
		return

	var/mob/new_player/newPlayer = new(usr.loc)
	newPlayer.client = player
	newPlayer.create_character()

	switch(equipment)
		if("Marine")

		if("Sergeant")
