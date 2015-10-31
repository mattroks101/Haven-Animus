#define AUTOLATHE_MAIN_MENU       1
#define AUTOLATHE_CATEGORY_MENU   2
#define AUTOLATHE_SEARCH_MENU     3

/obj/machinery/ammolathe
	name = "\improper Ammolathe"
	desc = "It produces ammo using metal, silver and plasma."
	icon_state = "autolathe"	//becuz no ammolathe icon
	density = 1

	var/m_amount = 0.0
	var/max_m_amount = 150000.0
	var/s_amount = 0.0
	var/max_s_amount = 60000.0
	var/p_amount = 0.0
	var/max_p_amount = 60000.0

	var/operating = 0.0
	anchored = 1.0
	var/list/L = list()
	var/list/LL = list()
	var/disabled = 0
	var/shocked = 0
	var/hack_wire
	var/disable_wire
	var/shock_wire
	use_power = 1
	idle_power_usage = 10
	active_power_usage = 100
	var/busy = 0
	var/prod_coeff
	var/datum/wires/ammolathe/wires = null

	var/datum/design/being_built
	var/datum/research/files
	var/list/datum/design/matching_designs
	var/selected_category
	var/screen = 1

	var/list/categories = list(\
							"Shotgun", \
							".357", \
							".45",\
							"5.56"\
							)

/obj/machinery/ammolathe/New()
	..()
	component_parts = list()
	component_parts += new /obj/item/weapon/circuitboard/ammolathe(null)
	component_parts += new /obj/item/weapon/stock_parts/matter_bin(null)
	component_parts += new /obj/item/weapon/stock_parts/matter_bin(null)
	component_parts += new /obj/item/weapon/stock_parts/matter_bin(null)
	component_parts += new /obj/item/weapon/stock_parts/manipulator(null)
	component_parts += new /obj/item/weapon/stock_parts/console_screen(null)
	RefreshParts()

	wires = new(src)
	files = new /datum/research/ammolathe(src)
	matching_designs = list()

/obj/machinery/ammolathe/interact(mob/user)
	if(!is_operational())
		return

	if(shocked && !(stat & NOPOWER))
		shock(user,50)

	var/dat

	if(panel_open)
		dat = wires.GetInteractWindow()

	else
		switch(screen)
			if(AUTOLATHE_MAIN_MENU)
				dat = main_win(user)
			if(AUTOLATHE_CATEGORY_MENU)
				dat = category_win(user,selected_category)
			if(AUTOLATHE_SEARCH_MENU)
				dat = search_win(user)

	var/datum/browser/popup = new(user, "ammolathe", name, 400, 500)
	popup.set_content(dat)
	popup.open()

	return

/obj/machinery/ammolathe/attackby(obj/item/O, mob/user, params)
	if (busy)
		user << "<span class=\"alert\">The ammolathe is busy. Please wait for completion of previous operation.</span>"
		return 1

	if(default_deconstruction_screwdriver(user, "autolathe_t", "autolathe", O))
		updateUsrDialog()
		return

	if(exchange_parts(user, O))
		return

	if (panel_open)
		if(istype(O, /obj/item/weapon/crowbar))
			if(m_amount >= 3750)
				var/obj/item/stack/sheet/metal/G = new /obj/item/stack/sheet/metal(src.loc)
				G.amount = round(m_amount / 3750)
			if(s_amount >= 2000)
				var/obj/item/stack/sheet/mineral/silver/G = new /obj/item/stack/sheet/mineral/silver(src.loc)
				G.amount = round(s_amount / 2000)
			if(p_amount >= 2000)
				var/obj/item/stack/sheet/mineral/plasma/G = new /obj/item/stack/sheet/mineral/plasma(src.loc)
				G.amount = round(p_amount / 2000)
			default_deconstruction_crowbar(O)
			return 1
		else
			attack_hand(user)
			return 1
	if (stat)
		return 1

	if (!istype(O, /obj/item/stack/sheet))
		return 1

	var/amount = 1
	var/obj/item/stack/sheet/stack = O
	var/m_amt = O.m_amt
	var/s_amt = 0
	var/p_amt = 0

	if (src.m_amount + O.m_amt > max_m_amount)
		user << "\red The ammolathe is full. Please remove metal from the autolathe in order to insert more."
		return 1
	if (stack.sheettype == "silver")
		s_amt = stack.perunit
		if (src.s_amount + s_amt > max_s_amount)
			user << "\red The ammolathe is full. Please remove silver from the autolathe in order to insert more."
			return 1
	if (stack.sheettype == "plasma")
		p_amt = stack.perunit
		if (src.p_amount + p_amt > max_p_amount)
			user << "\red The ammolathe is full. Please remove plasma from the autolathe in order to insert more."
			return 1
	if (m_amt == 0 && s_amt == 0 && p_amt == 0)
		return 1

	amount = stack.amount
	if (m_amt)
		amount = min(amount, round((max_m_amount-m_amount)/m_amt))
		flick("autolathe_o",src)//plays metal insertion animation
	if (s_amt)
		amount = min(amount, round((max_s_amount-s_amount)/s_amt))
		flick("autolathe_r",src)//plays glass insertion animation becuz no silver
	if (p_amt)
		amount = min(amount, round((max_p_amount-p_amount)/p_amt))
		flick("autolathe_r",src)//plays glass insertion animation becuz no plasma
	stack.use(amount)
	icon_state = "autolathe"
	busy = 1
	use_power(max(1000, (m_amt+s_amt+p_amt)*amount/10))
	src.m_amount += m_amt * amount
	src.s_amount += s_amt * amount
	src.p_amount += p_amt * amount
	user << "<span class='notice'>You insert [amount] sheet[amount>1 ? "s" : ""] to the ammolathe.</span>"
	if (O && O.loc == src)
		qdel(O)
	busy = 0
	src.updateUsrDialog()

/obj/machinery/ammolathe/attack_paw(mob/user)
	return attack_hand(user)

/obj/machinery/ammolathe/attack_hand(mob/user)
	if(..(user))
		return
	user.set_machine(src)
	interact(user)

/obj/machinery/ammolathe/Topic(href, href_list)
	if(..())
		return
	if (!busy)
		if(href_list["menu"])
			screen = text2num(href_list["menu"])

		if(href_list["category"])
			selected_category = href_list["category"]

		if(href_list["make"])

			/////////////////
			//href protection
			being_built = files.FindDesignByID(href_list["make"]) //check if it's a valid design
			if(!being_built)
				return
			/////////////////

			var/coeff = 2 ** prod_coeff
			var/metal_cost = being_built.materials["$metal"]
			var/silver_cost = being_built.materials["$silver"]
			var/plasma_cost = being_built.materials["$plasma"]

			var/power = max(2000, (metal_cost+silver_cost+plasma_cost))

			if((m_amount >= metal_cost/coeff) && (s_amount >= silver_cost/coeff) && (p_amount >= plasma_cost/coeff))
				busy = 1
				use_power(power)
				icon_state = "autolathe"
				flick("autolathe_n",src)
				spawn(32/coeff)
					use_power(power)
					m_amount -= metal_cost
					s_amount -= silver_cost
					p_amount -= plasma_cost
					var/obj/item/new_item = new being_built.build_path(src.loc)
					new_item.m_amt /= coeff
					new_item.g_amt /= coeff
					if(m_amount < 0)
						m_amount = 0
					if(s_amount < 0)
						s_amount = 0
					if(p_amount < 0)
						p_amount = 0
					busy = 0
					src.updateUsrDialog()

		if(href_list["search"])
			matching_designs.Cut()

			for(var/datum/design/D in files.known_designs)
				if(findtext(D.name,href_list["to_search"]))
					matching_designs.Add(D)
	else
		usr << "<span class=\"alert\">The ammolathe is busy. Please wait for completion of previous operation.</span>"

	src.updateUsrDialog()

	return

/obj/machinery/ammolathe/RefreshParts()
	var/tot_rating = 0
	prod_coeff = 0
	for(var/obj/item/weapon/stock_parts/matter_bin/MB in component_parts)
		tot_rating += MB.rating
	tot_rating *= 24000
	max_m_amount = tot_rating * 25 / 12
	max_s_amount = tot_rating
	max_p_amount = tot_rating
	for(var/obj/item/weapon/stock_parts/manipulator/M in component_parts)
		prod_coeff += M.rating - 1

/obj/machinery/ammolathe/proc/main_win(mob/user)
	var/dat = "<div class='statusDisplay'><h3>Autolathe Menu:</h3><br>"
	dat += "<b>Metal amount:</b> [src.m_amount] / [max_m_amount] cm<sup>3</sup><br>"
	dat += "<b>Silver amount:</b> [src.s_amount] / [max_s_amount] cm<sup>3</sup><br>"
	dat += "<b>Plasma amount:</b> [src.p_amount] / [max_p_amount] cm<sup>3</sup>"

	dat += "<form name='search' action='?src=\ref[src]'> \
	<input type='hidden' name='src' value='\ref[src]'> \
	<input type='hidden' name='search' value='to_search'> \
	<input type='hidden' name='menu' value='[AUTOLATHE_SEARCH_MENU]'> \
	<input type='text' name='to_search'> \
	<input type='submit' value='Search'> \
	</form><hr>"

	var/line_length = 1
	dat += "<table style='width:100%' align='center'><tr>"

	for(var/C in categories)
		if(line_length > 2)
			dat += "</tr><tr>"
			line_length = 1

		dat += "<td><A href='?src=\ref[src];category=[C];menu=[AUTOLATHE_CATEGORY_MENU]'>[C]</A></td>"
		line_length++

	dat += "</tr></table></div>"
	return dat

/obj/machinery/ammolathe/proc/category_win(mob/user,var/selected_category)
	var/dat = "<A href='?src=\ref[src];menu=[AUTOLATHE_MAIN_MENU]'>Return to main menu</A>"
	dat += "<div class='statusDisplay'><h3>Browsing [selected_category]:</h3><br>"
	dat += "<b>Metal amount:</b> [src.m_amount] / [max_m_amount] cm<sup>3</sup><br>"
	dat += "<b>Silver amount:</b> [src.s_amount] / [max_s_amount] cm<sup>3</sup><br>"
	dat += "<b>Plasma amount:</b> [src.p_amount] / [max_p_amount] cm<sup>3</sup><hr>"

	for(var/datum/design/D in files.known_designs)
		if(!(selected_category in D.category))
			continue

		if(disabled || !can_build(D))
			dat += "<span class='linkOff'>[D.name]</span>"
		else
			dat += "<a href='?src=\ref[src];make=[D.id];multiplier=1'>[D.name]</a>"

		dat += "[get_design_cost(D)]<br>"

	dat += "</div>"
	return dat

/obj/machinery/ammolathe/proc/search_win(mob/user)
	var/dat = "<A href='?src=\ref[src];menu=[AUTOLATHE_MAIN_MENU]'>Return to main menu</A>"
	dat += "<div class='statusDisplay'><h3>Search results:</h3><br>"
	dat += "<b>Metal amount:</b> [src.m_amount] / [max_m_amount] cm<sup>3</sup><br>"
	dat += "<b>Silver amount:</b> [src.s_amount] / [max_s_amount] cm<sup>3</sup><br>"
	dat += "<b>Plasma amount:</b> [src.p_amount] / [max_p_amount] cm<sup>3</sup><hr>"

	for(var/datum/design/D in matching_designs)
		if(disabled || !can_build(D))
			dat += "<span class='linkOff'>[D.name]</span>"
		else
			dat += "<a href='?src=\ref[src];make=[D.id];multiplier=1'>[D.name]</a>"

		dat += "[get_design_cost(D)]<br>"

	dat += "</div>"
	return dat

/obj/machinery/ammolathe/proc/can_build(var/datum/design/D)
	var/coeff = (ispath(D.build_path,/obj/item/stack) ? 1 : 2 ** prod_coeff)

	if(D.materials["$metal"] && (m_amount < (D.materials["$metal"] / coeff)))
		return 0
	if(D.materials["$silver"] && (s_amount < (D.materials["$silver"] / coeff)))
		return 0
	if(D.materials["$silver"] && (p_amount < (D.materials["$silver"] / coeff)))
		return 0
	return 1

/obj/machinery/ammolathe/proc/get_design_cost(var/datum/design/D)
	var/coeff = (ispath(D.build_path,/obj/item/stack) ? 1 : 2 ** prod_coeff)
	var/dat
	if(D.materials["$metal"])
		dat += "[D.materials["$metal"] / coeff] metal "
	if(D.materials["$silver"])
		dat += "[D.materials["$silver"] / coeff] silver "
	if(D.materials["$plasma"])
		dat += "[D.materials["$plasma"] / coeff] plasma"
	return dat

/obj/machinery/ammolathe/proc/shock(mob/user, prb)
	if(stat & (BROKEN|NOPOWER))		// unpowered, no shock
		return 0
	if(!prob(prb))
		return 0
	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(5, 1, src)
	s.start()
	if (electrocute_mob(user, get_area(src), src, 0.7))
		return 1
	else
		return 0