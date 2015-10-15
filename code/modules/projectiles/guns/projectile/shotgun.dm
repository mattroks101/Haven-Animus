/obj/item/weapon/gun/projectile/shotgun
	name = "shotgun"
	desc = "Useful for sweeping alleys."
	icon_state = "shotgun"
	item_state = "shotgun"
	w_class = 4.0
	force = 10
	slot_flags = SLOT_BACK
	origin_tech = "combat=4;materials=2"
	mag_type = /obj/item/ammo_magazine/internal/shot
	var/recentpump = 0 // to prevent spammage
	var/pumped = 0

/obj/item/weapon/gun/projectile/shotgun/process_chambered()
	var/obj/item/ammo_casing/AC = chambered //Find chambered round
	if(isnull(AC) || !istype(AC))
		return 0

	AC.on_fired()

	if(AC.BB)
		in_chamber = AC.BB //Load projectile into chamber.
		AC.BB.loc = src //Set projectile loc to gun.
		AC.BB = null
		AC.update_icon()
		return 1
	return 0


/obj/item/weapon/gun/projectile/shotgun/attack_self(mob/living/user as mob)
	if(recentpump)	return
	pump()
	recentpump = 1
	spawn(5)
		recentpump = 0
	return


/obj/item/weapon/gun/projectile/shotgun/proc/pump(mob/M as mob)
	playsound(M, 'sound/weapons/shotgunpump.ogg', 60, 1)
	pumped = 0
	if(chambered)//We have a shell in the chamber
		chambered.loc = get_turf(src)//Eject casing
		chambered.SpinAnimation(5, 1)
		chambered = null
		if(in_chamber)
			in_chamber = null
	if(!magazine.ammo_count())	return 0
	var/obj/item/ammo_casing/AC = magazine.get_round() //load next casing.
	chambered = AC
	update_icon()	//I.E. fix the desc
	return 1

/obj/item/weapon/gun/projectile/shotgun/examine()
	..()
	if (chambered)
		usr << "A [chambered.BB ? "live" : "spent"] one is in the chamber."

/obj/item/weapon/gun/projectile/shotgun/combat
	name = "combat shotgun"
	icon_state = "cshotgun"
	origin_tech = "combat=5;materials=2"
	mag_type = /obj/item/ammo_magazine/internal/shot/com
	w_class = 5


/obj/item/weapon/gun/projectile/revolver/doublebarrel
	name = "double-barreled shotgun"
	desc = "A true classic."
	icon_state = "dshotgun"
	item_state = "shotgun"
	w_class = 4
	force = 10
	slot_flags = SLOT_BACK
	origin_tech = "combat=3;materials=1"
	mag_type = /obj/item/ammo_magazine/internal/dualshot
	var/sawn_desc = "Omar's coming!"
	var/sawn = 0

/obj/item/weapon/gun/projectile/revolver/doublebarrel/attackby(var/obj/item/A as obj, mob/user as mob)
	..()
	if(istype(A, /obj/item/weapon/circular_saw) || istype(A, /obj/item/weapon/melee/energy) || istype(A, /obj/item/weapon/gun/energy/plasmacutter))
		if(sawn)
			user << "<span class='notice'>\The [src] is already sawn!</span>"
		user << "<span class='notice'>You begin to shorten the barrel of \the [src].</span>"
		if(get_ammo())
			afterattack(user, user)	//will this work?
			afterattack(user, user)	//it will. we call it twice, for twice the FUN
			playsound(user, fire_sound, 50, 1)
			user.visible_message("<span class='danger'>The shotgun goes off!</span>", "<span class='danger'>The shotgun goes off in your face!</span>")
			return
		if(do_after(user, 30))	//SHIT IS STEALTHY EYYYYY
			icon_state = "[icon_state]-sawn"
			w_class = 3
			item_state = "gun"
			slot_flags &= ~SLOT_BACK	//you can't sling it on your back
			slot_flags |= SLOT_BELT		//but you can wear it on your belt (poorly concealed under a trenchcoat, ideally)
			user << "<span class='warning'>You shorten the barrel of \the [src]!</span>"
			name = "sawn-off [src.name]"
			desc = sawn_desc
			sawn = 1

/obj/item/weapon/gun/projectile/revolver/doublebarrel/attack_self(mob/living/user as mob)
	var/num_unloaded = 0
	while (get_ammo() > 0)
		var/obj/item/ammo_casing/CB
		CB = magazine.get_round(0)
		chambered = null
		if(CB && !istype(CB, /obj/item/ammo_casing/none))
			CB.loc = get_turf(src.loc)
			CB.update_icon()
			num_unloaded++
		magazine.on_empty()
	if (num_unloaded)
		user << "<span class = 'notice'>You break open \the [src] and unload [num_unloaded] shell\s.</span>"
	else
		user << "<span class='notice'>[src] is empty.</span>"

// IMPROVISED SHOTGUN //

/obj/item/weapon/gun/projectile/revolver/doublebarrel/improvised
	name = "improvised shotgun"
	desc = "Essentially a tube that aims shotgun shells."
	icon_state = "ishotgun"
	item_state = "shotgun"
	w_class = 4.0
	force = 10
	origin_tech = "combat=2;materials=2"
	mag_type = /obj/item/ammo_magazine/internal/improvised
	sawn_desc = "I'm just here for the gasoline."

/obj/item/weapon/gun/projectile/revolver/doublebarrel/improvised/attackby(var/obj/item/A as obj, mob/user as mob)
	..()
	if(istype(A, /obj/item/stack/cable_coil) && !sawn)
		var/obj/item/stack/cable_coil/C = A
		if(C.use(10))
			flags =  CONDUCT
			slot_flags = SLOT_BACK
			icon_state = "ishotgunsling"
			user << "<span class='notice'>You tie the lengths of cable to the shotgun, making a sling.</span>"
			update_icon()
		else
			user << "<span class='warning'>You need at least ten lengths of cable if you want to make a sling.</span>"
			return

/obj/item/weapon/gun/projectile/revolver/doublebarrel/spin()
	set invisibility = 101




//////////////////////////////////////////////////////////////////
////////////////OH SHIT//////////////////////////////////////////
////////////////////////////////////////////////////////////////
/obj/item/weapon/gun/projectile/revolver/doublebarrel/Wunderwaffe
	icon_action_button = "action_wunderwaffe"

	var/
		obj/item/weapon/reagent_containers/spray/chemsprayer/canopy/spray_module = null
		obj/item/weapon/grenade_launcher_canopy/granade_module = null
		obj/item/weapon/cell/power_supply_module //What type of power cell this uses
		obj/item/weapon/kitchen/utensil/knife_module = null
		obj/item/weapon/breaker_device/brd_module = null
		obj/item/weapon/ion_emitter/ion_module = /obj/item/weapon/ion_emitter

		fire_mode = 5
		matter = 0
		list/grenades = list()
		max_grenades = 2                                // tak shepard scazal
		open = 0
		charge_cost = 100

		volume = 40
		amount_per_transfer_from_this = 10
		projectile_type = "/obj/item/projectile/ion"
		cell_type = "/obj/item/weapon/cell"


	examine()
		if (!(usr in view(2)) && usr!=src.loc)
			return ..()
		else
			return ..() + "[spray_module ? spray_module.name + "\n" : ][granade_module ? granade_module.name + "\n":][power_supply_module ? power_supply_module.name + "\n":][ knife_module ? knife_module.name + "\n":][ brd_module ? brd_module.name + "\n":][ ion_module ? ion_module.name :]"





	process_chambered()
		switch(fire_mode)
			if(3)
				if(in_chamber)	return 1
				if(!power_supply_module)	return 0
				if(!power_supply_module.use(charge_cost))	return 0
				if(!projectile_type)	return 0
				in_chamber = new projectile_type(src)
				return 1
			if(5)
				var/obj/item/ammo_casing/AC = chambered //Find chambered round
				if(isnull(AC) || !istype(AC))
					return 0

				AC.on_fired()

				if(AC.BB)
					in_chamber = AC.BB //Load projectile into chamber.
					AC.BB.loc = src //Set projectile loc to gun.
					AC.BB = null
					AC.update_icon()
					return 1
				return 0


	afterattack(atom/target as mob|obj, mob/user as mob, flag)
		switch(fire_mode)
			if(1)
				if(granade_module)
					if (target == user || istype(target, /obj/item/weapon/storage/backpack ) || locate (/obj/structure/table, src.loc))
						return usr << "grenade return"

					if(grenades.len)
						spawn(0) fire_grenade(target,user)
					else
						usr << "\red The [src]  is empty."
					return
				else
					user << "<span class='warning'>No!</span>"
			if(2)
				if(spray_module)
					if(istype(target, /obj/item/weapon/storage) || istype(target, /obj/structure/table) || istype(target, /obj/structure/rack) || istype(target, /obj/structure/closet) \
					|| istype(target, /obj/item/weapon/reagent_containers) || istype(target, /obj/structure/sink))
						return

					if(istype(target, /obj/effect/proc_holder/spell))
						return
					var/Sprays[3]
					for(var/i=1, i<=3, i++) // intialize sprays
						if(src.reagents.total_volume < 1) break
						var/obj/effect/decal/chempuff/D = new/obj/effect/decal/chempuff(get_turf(src))
						D.create_reagents(amount_per_transfer_from_this)
						src.reagents.trans_to(D, amount_per_transfer_from_this)

						D.icon += mix_color_from_reagents(D.reagents.reagent_list)

						Sprays[i] = D

					var/direction = get_dir(src, target)
					var/turf/T = get_turf(target)
					var/turf/T1 = get_step(T,turn(direction, 90))
					var/turf/T2 = get_step(T,turn(direction, -90))
					var/list/the_targets = list(T,T1,T2)

					for(var/i=1, i<=Sprays.len, i++)
						spawn()
							var/obj/effect/decal/chempuff/D = Sprays[i]
							if(!D) continue

							// Spreads the sprays a little bit
							var/turf/my_target = pick(the_targets)
							the_targets -= my_target

							for(var/j=1, j<=rand(6,8), j++)
								step_towards(D, my_target)
								D.reagents.reaction(get_turf(D))
								for(var/atom/t in get_turf(D))
									D.reagents.reaction(t)
								sleep(2)
							del(D)

					playsound(src.loc, 'sound/effects/spray2.ogg', 50, 1, -6)

					if(reagents.has_reagent("sacid"))
						message_admins("[key_name_admin(user)] fired sulphuric acid from a chem sprayer.")
						log_game("[key_name(user)] fired sulphuric acid from a chem sprayer.")
					if(reagents.has_reagent("pacid"))
						message_admins("[key_name_admin(user)] fired Polyacid from a chem sprayer.")
						log_game("[key_name(user)] fired Polyacid from a chem sprayer.")
					if(reagents.has_reagent("lube"))
						message_admins("[key_name_admin(user)] fired Space lube from a chem sprayer.")
						log_game("[key_name(user)] fired Space lube from a chem sprayer.")
					return
				else
					user << "<span class='warning'>Why this not workning? Maybe try again</span>"
					return

			if(3)
				if(ion_module)
					if(in_chamber)
						usr << "ion_module "
						return 1
					if(!power_supply_module)
						usr << "ion_module power_supply_module"
						return 0
					if(!power_supply_module.use(charge_cost))
						usr << "ion_module  power_supply_module use"
						return 0
					if(!projectile_type)
						usr << "ion_module  projectile_type"
						return 0

					in_chamber = new projectile_type(src)
					usr << "ion_module ok "
					return 1
				else
					user << "<span class='warning'>Nope.</span>"
					return
			if(4)
				if(brd_module)
					if(istype(target,/area/shuttle)||istype(target,/turf/space/transit))
						return 0
					if(!(istype(target, /turf) || istype(target, /obj/machinery/door/airlock)))
						return 0

					if(istype(target, /turf/simulated/wall))
						if(istype(target, /turf/simulated/wall/r_wall))
							return 0
						if(brd_module.matter >= 10)
							user << "Deconstructing Wall..."
							playsound(src.loc, 'sound/machines/click.ogg', 50, 1)
							if(do_after(user, 40))
								if(!brd_module.matter - 10) return 0
								brd_module.matter-=10
								target:ChangeTurf(/turf/simulated/floor/plating/airless)
								return 1
						return 0

					if(istype(target, /turf/simulated/floor) && !istype(target, /turf/simulated/floor/open))
						if(brd_module.matter >= 5)
							user << "Deconstructing Floor..."
							playsound(src.loc, 'sound/machines/click.ogg', 50, 1)
							if(do_after(user, 50))
								if(!brd_module.matter - 5) return 0
								brd_module.matter-=5
								target:ChangeTurf(/turf/space)
								return 1
						return 0

					if(istype(target, /obj/machinery/door/airlock))
						if(brd_module.matter >= 10)
							user << "Deconstructing Airlock..."
							playsound(src.loc, 'sound/machines/click.ogg', 50, 1)
							if(do_after(user, 50))
								if(!brd_module.matter - 10) return 0
								brd_module.matter-=10
								del(target)
								return 1
						return	0
					return 0
				else
					user << "<span class='warning'>Okay</span>"
					return
			if(5)
				..()




	attack_self(mob/living/user as mob)

		if(fire_mode == 1 && granade_module)
			for(var/obj/item/weapon/grenade/G in grenades)
				//user.put_in_hands(new G)
				user << "<span class='notice'>You got [G] from [src]</span>"
				G.loc = user.loc
				grenades.Remove(G)
			if(grenades.len == 0)
				new granade_module(user.loc)
				src.granade_module = null
				user << "<span class='notice'>You got [granade_module] from [src]</span>"

		if(fire_mode == 2 && spray_module)
			user.put_in_hands(new spray_module)
			src.spray_module = null

		if(fire_mode == 3 && power_supply_module)
			user.put_in_hands(new power_supply_module)
			src.power_supply_module = null

		if(fire_mode == 4 && brd_module)
			user.put_in_hands(new brd_module)
			src.brd_module = null

		if(fire_mode == 5)
			return ..()





	attackby(obj/item/weapon/W as obj, mob/user as mob)

		if(istype(W, /obj/item/weapon/screwdriver))
			if(open)
				usr << "You Tighten the screws on [src]."
				open = 0
			else
				usr << "You unscrewed the bolts on [src]."
				open = 1
		if(istype(W, /obj/item/weapon/kitchen/utensil) && !knife_module)
			knife_module = W

			user.drop_item()
			W.loc = src.loc
			user << "<span class='notice'>You attache the [W.name] to [name].</span>"
		if(istype(W, /obj/item/weapon/reagent_containers/spray/chemsprayer/canopy) && !spray_module)
			spray_module = W
			user.drop_item()
			W.loc = src.loc
			user << "<span class='notice'>You attache the [W.name] to [name].</span>"
		if(istype(W, /obj/item/weapon/grenade_launcher_canopy) && !granade_module)
			granade_module = W
			user.drop_item()
			W.loc = src.loc

			user << "<span class='notice'>You attache the [W.name] to [name].</span>"
		if(istype(W, /obj/item/weapon/cell) && !power_supply_module)
			power_supply_module = W
			user.drop_item()
			W.loc = src.loc
			user << "<span class='notice'>You attache the [W.name] to [name].</span>"

		if(istype(W, /obj/item/weapon/breaker_device) && !brd_module)
			brd_module = W
			user.drop_item()
			W.loc = src.loc
			user << "<span class='notice'>You attache the [W.name] to [name].</span>"



		if(istype(W, /obj/item/weapon/rcd_ammo) && brd_module)
			if(brd_module.matter >= 10)
				user << "<span class='notice'>The [name] cant hold any more matter-units.</span>"
				return
			user.drop_item()
			del(W)
			brd_module.matter += 10
			playsound(src.loc, 'sound/machines/click.ogg', 50, 1)

		if((istype(W, /obj/item/weapon/grenade)))
			if(grenades.len < max_grenades)
				user.drop_item()
				W.loc = src
				grenades += W
				user << "\blue You put the grenade in the [name]."
				user << "\blue [grenades.len] / [max_grenades] Grenades."
			else
				usr << "\red The [src.name] cannot hold more grenades."

		..()


	ui_action_click()
		change_fire_mode(usr)

	emp_act(severity)
		if(severity <= 2 && power_supply_module)
			power_supply_module.use(round(power_supply_module.maxcharge / severity))
			update_icon()
		else
			return

	proc
		fire_grenade(atom/target, mob/user)
			for(var/mob/O in viewers(world.view, user))
				O.show_message(text("\red [] fired a grenade!", user), 1)
			user << "\red You fire the grenade launcher!"
			var/obj/item/weapon/grenade/chem_grenade/F = grenades[1] //Now with less copypasta!
			grenades -= F
			F.loc = user.loc
			F.throw_at(target, 30, 2, user)
			message_admins("[key_name_admin(user)] fired a grenade ([F.name]) from a grenade launcher ([src.name]).")
			log_game("[key_name_admin(user)] used a grenade ([src.name]).")
			F.active = 1
			F.icon_state = initial(icon_state) + "_active"
			playsound(user.loc, 'sound/weapons/armbomb.ogg', 75, 1, -3)
			spawn(15)
			F.prime()


		activate()
			playsound(src.loc, 'sound/items/Deconstruct.ogg', 50, 1)







	verb
		change_fire_mode(mob/living/user as mob)
			set name = "Change fire mode"
			set category = "Object"
			var/mode = "grenade launcher"
			var/counter = fire_mode
			while(1)
				counter++
				if(counter > 5)
					counter = 0
				if(counter == 1 && granade_module)
					fire_mode = counter
					mode = "grenade launcher"
					break
				else if(counter == 2 && spray_module)
					fire_mode = counter
					mode = "sprayer"
					break
				else if(counter == 3 && ion_module)
					fire_mode = counter
					mode = "ion fire"
					break
				else if(counter == 4 && brd_module)
					fire_mode = counter
					mode = "breaking device"
					break
				else if(counter == 5)
					fire_mode = counter
					mode = "bullet firing"
					break
			user << "<span class='notice'>You change fire mode of [src.name] to [mode].</span>"
			return

/obj/item/weapon/grenade_launcher_canopy
	name = "Grenade launcher canope"
	icon = 'icons/obj/gun.dmi'
	icon_state = "riotgun"
	w_class = 1.0
	force = 3.0

/obj/item/weapon/ion_emitter
	name = "ion emitter"
	icon = 'icons/obj/gun.dmi'
	icon_state = "riotgun"
	w_class = 1.0
	force = 3.0

/obj/item/weapon/breaker_device
	name = "breaker device"
	icon = 'icons/obj/gun.dmi'
	icon_state = "riotgun"
	w_class = 1.0
	force = 3.0
	var/matter = 0

/obj/item/weapon/reagent_containers/spray/chemsprayer/canopy
	name = "spray canopy"
	icon = 'icons/obj/gun.dmi'
	icon_state = "riotgun"
	w_class = 1.0
	force = 3.0

	New()
		..()
		reagents.add_reagent("condensedcapsaicin", 120)

	afterattack()
		return