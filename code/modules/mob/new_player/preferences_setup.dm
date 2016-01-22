datum/preferences
	//The mob should have a gender you want before running this proc. Will run fine without H
	proc/randomize_appearance_for(var/mob/living/carbon/human/H)
		if(H)
			if(H.gender == MALE)
				gender = MALE
			else
				gender = FEMALE
		s_tone = random_skin_tone()
		h_style = random_hair_style(gender, species)
		f_style = random_facial_hair_style(gender, species)
		randomize_hair_color("hair")
		randomize_hair_color("facial")
		randomize_eyes_color()
		underwear = rand(1,underwear_m.len)
		backbag = 2
		age = rand(AGE_MIN,AGE_MAX)
		if(H)
			copy_to(H,1)


	proc/randomize_hair_color(var/target = "hair")
		if(prob (75) && target == "facial") // Chance to inherit hair color
			r_facial = r_hair
			g_facial = g_hair
			b_facial = b_hair
			return

		var/red
		var/green
		var/blue

		var/col = pick ("blonde", "black", "chestnut", "copper", "brown", "wheat", "old", "punk")
		switch(col)
			if("blonde")
				red = 255
				green = 255
				blue = 0
			if("black")
				red = 0
				green = 0
				blue = 0
			if("chestnut")
				red = 153
				green = 102
				blue = 51
			if("copper")
				red = 255
				green = 153
				blue = 0
			if("brown")
				red = 102
				green = 51
				blue = 0
			if("wheat")
				red = 255
				green = 255
				blue = 153
			if("old")
				red = rand (100, 255)
				green = red
				blue = red
			if("punk")
				red = rand (0, 255)
				green = rand (0, 255)
				blue = rand (0, 255)

		red = max(min(red + rand (-25, 25), 255), 0)
		green = max(min(green + rand (-25, 25), 255), 0)
		blue = max(min(blue + rand (-25, 25), 255), 0)

		switch(target)
			if("hair")
				r_hair = red
				g_hair = green
				b_hair = blue
			if("facial")
				r_facial = red
				g_facial = green
				b_facial = blue

	proc/randomize_eyes_color()
		var/red
		var/green
		var/blue

		var/col = pick ("black", "grey", "brown", "chestnut", "blue", "lightblue", "green", "albino")
		switch(col)
			if("black")
				red = 0
				green = 0
				blue = 0
			if("grey")
				red = rand (100, 200)
				green = red
				blue = red
			if("brown")
				red = 102
				green = 51
				blue = 0
			if("chestnut")
				red = 153
				green = 102
				blue = 0
			if("blue")
				red = 51
				green = 102
				blue = 204
			if("lightblue")
				red = 102
				green = 204
				blue = 255
			if("green")
				red = 0
				green = 102
				blue = 0
			if("albino")
				red = rand (200, 255)
				green = rand (0, 150)
				blue = rand (0, 150)

		red = max(min(red + rand (-25, 25), 255), 0)
		green = max(min(green + rand (-25, 25), 255), 0)
		blue = max(min(blue + rand (-25, 25), 255), 0)

		r_eyes = red
		g_eyes = green
		b_eyes = blue


	proc/update_preview_icon()		//seriously. This is horrendous.
		del(preview_icon_front)
		del(preview_icon_side)
		del(preview_icon)

		var/g = "m"
		if(gender == FEMALE)	g = "f"

		var/icon/icobase
		var/datum/species/current_species = all_species[species]

		var/uniform_icon = 'icons/mob/uniform.dmi'
		var/shoes_icon = 'icons/mob/feet.dmi'
		var/back_icon = 'icons/mob/back.dmi'
		var/gloves_icon = 'icons/mob/hands.dmi'
		var/suit_icon = 'icons/mob/suit.dmi'

		switch(fat)
			if("fat")
				uniform_icon = 'icons/mob/uniform_fat.dmi'
				shoes_icon = 'icons/mob/feet_fat.dmi'
				back_icon = 'icons/mob/back_fat.dmi'
				gloves_icon = 'icons/mob/hands_fat.dmi'
				suit_icon = 'icons/mob/suit_fat.dmi'
			if("slim")
				uniform_icon = 'icons/mob/uniform_slim.dmi'
				shoes_icon = 'icons/mob/feet_slim.dmi'
				back_icon = 'icons/mob/back_slim.dmi'
				gloves_icon = 'icons/mob/hands_slim.dmi'
				suit_icon = 'icons/mob/suit_slim.dmi'

		if(current_species)
			icobase = current_species.icobase
		else
			icobase = 'icons/mob/human_races/r_human.dmi'

		preview_icon = new /icon(icobase, "torso_[g][fat ? "_[fat]" : ""]")
		preview_icon.Blend(new /icon(icobase, "groin_[g][fat ? "_[fat]" : ""]"), ICON_OVERLAY)
		preview_icon.Blend(new /icon(icobase, "head_[g][fat ? "_[fat]" : ""]"), ICON_OVERLAY)
		//Лоли пидр

		for(var/name in list("l_arm","r_arm","l_leg","r_leg","l_foot","r_foot","l_hand","r_hand"))
			// make sure the organ is added to the list so it's drawn
			if(organ_data[name] == null)
				organ_data[name] = null

		for(var/name in organ_data)
			if(organ_data[name] == "amputated") continue

			var/icon/temp = new /icon(icobase, "[name]_[g][fat ? "_[fat]" : ""]")
			if(organ_data[name] == "cyborg")
				temp.MapColors(rgb(77,77,77), rgb(150,150,150), rgb(28,28,28), rgb(0,0,0))

			preview_icon.Blend(temp, ICON_OVERLAY)

		// Skin tone
		if(current_species && (current_species.flags & HAS_SKIN_TONE))
			if (s_tone >= 0)
				preview_icon.Blend(rgb(s_tone, s_tone, s_tone), ICON_ADD)
			else
				preview_icon.Blend(rgb(-s_tone,  -s_tone,  -s_tone), ICON_SUBTRACT)

		var/icon/eyes_s = new/icon("icon" = 'icons/mob/human_face.dmi', "icon_state" = current_species ? current_species.eyes : "eyes_s")
		eyes_s.Blend(rgb(r_eyes, g_eyes, b_eyes), ICON_ADD)

		var/datum/sprite_accessory/hair_style = hair_styles_list[h_style]
		if(hair_style)
			var/icon/hair_s = new/icon("icon" = hair_style.icon, "icon_state" = "[hair_style.icon_state]_s")
			hair_s.Blend(rgb(r_hair, g_hair, b_hair), ICON_ADD)
			eyes_s.Blend(hair_s, ICON_OVERLAY)

		var/datum/sprite_accessory/facial_hair_style = facial_hair_styles_list[f_style]
		if(facial_hair_style)
			var/icon/facial_s = new/icon("icon" = facial_hair_style.icon, "icon_state" = "[facial_hair_style.icon_state]_s")
			facial_s.Blend(rgb(r_facial, g_facial, b_facial), ICON_ADD)
			eyes_s.Blend(facial_s, ICON_OVERLAY)

		var/icon/clothes = null
		if(job_civilian_low & ASSISTANT || !job_master)//This gives the preview icon clothes depending on which job(if any) is set to 'high'
			clothes = new /icon(uniform_icon, "grey_s")
			clothes.Blend(new /icon(shoes_icon, "black"), ICON_UNDERLAY)
			if(backbag == 2)
				clothes.Blend(new /icon(back_icon, "backpack"), ICON_OVERLAY)
			else if(backbag == 3 || backbag == 4)
				clothes.Blend(new /icon(back_icon, "satchel"), ICON_OVERLAY)

		else
			var/datum/job/J = job_master.GetJob(high_job_title)
			if(J)//I hate how this looks, but there's no reason to go through this switch if it's empty

				var/obj/item/clothing/under/UF = J.uniform
				var/UF_state = initial(UF.item_color)
				if(!UF_state) UF_state = initial(UF.icon_state)
				clothes = new /icon(uniform_icon, UF_state)

				var/obj/item/clothing/shoes/SH = J.shoes
				clothes.Blend(new /icon(shoes_icon, initial(SH.icon_state)), ICON_UNDERLAY)

				var/obj/item/clothing/gloves/GL = J.gloves
				if(GL)
					var/GL_state = initial(GL.item_state)
					if(!GL_state) GL_state = initial(GL.item_state)
					clothes.Blend(new /icon(gloves_icon, ), ICON_UNDERLAY)

/*
				var/obj/item/weapon/storage/belt/BT = J.belt
				if(BT)
					var/BT_state = initial(BT.item_state)
					if(!BT_state) BT_state = initial(BT.icon_state)
					clothes.Blend(new /icon(belt_icon, BT_state), ICON_OVERLAY)
*/

				var/obj/item/clothing/suit/ST = J.suit
				if(ST) clothes.Blend(new /icon(suit_icon, initial(ST.icon_state)), ICON_OVERLAY)

				var/obj/item/clothing/head/HT = J.hat
				if(HT) clothes.Blend(new /icon('icons/mob/head.dmi', initial(HT.icon_state)), ICON_OVERLAY)

				if( backbag > 1 )
					var/obj/item/weapon/storage/backpack/BP = J.backpacks[backbag-1]
					clothes.Blend(new /icon(back_icon, initial(BP.icon_state)), ICON_OVERLAY)

		if(disabilities & NEARSIGHTED)
			preview_icon.Blend(new /icon('icons/mob/eyes.dmi', "glasses"), ICON_OVERLAY)

		preview_icon.Blend(eyes_s, ICON_OVERLAY)
		if(clothes)
			preview_icon.Blend(clothes, ICON_OVERLAY)
		preview_icon_front = new(preview_icon, dir = SOUTH)
		preview_icon_side = new(preview_icon, dir = WEST)

		del(eyes_s)
		del(clothes)