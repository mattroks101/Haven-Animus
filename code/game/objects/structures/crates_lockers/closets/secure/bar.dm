/obj/structure/closet/secure_closet/bar
	name = "Booze"
	req_access = list(access_bar)
	icon_state = "cabinetbar_locked"
	icon_closed = "cabinetbar"
	icon_locked = "cabinetbar_locked"
	icon_opened = "cabinetbar_open"
	icon_broken = "cabinetbar_broken"
	icon_off = "cabinetbar_broken"


	New()
		..()
		sleep(2)
		new /obj/item/weapon/reagent_containers/food/drinks/bottle/beer( src )
		new /obj/item/weapon/reagent_containers/food/drinks/bottle/beer( src )
		new /obj/item/weapon/reagent_containers/food/drinks/bottle/beer( src )
		new /obj/item/weapon/reagent_containers/food/drinks/bottle/beer( src )
		new /obj/item/weapon/reagent_containers/food/drinks/bottle/beer( src )
		new /obj/item/weapon/reagent_containers/food/drinks/bottle/beer( src )
		new /obj/item/weapon/reagent_containers/food/drinks/bottle/beer( src )
		new /obj/item/weapon/reagent_containers/food/drinks/bottle/beer( src )
		new /obj/item/weapon/reagent_containers/food/drinks/bottle/beer( src )
		new /obj/item/weapon/reagent_containers/food/drinks/bottle/beer( src )
		return

/obj/structure/closet/secure_closet/bar/update_icon()
	if(broken)
		icon_state = icon_broken
	else
		if(!opened)
			if(locked)
				icon_state = icon_locked
			else
				icon_state = icon_closed
		else
			icon_state = icon_opened