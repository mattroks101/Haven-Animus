/obj/machinery/computer
	name = "computer"
	icon = 'icons/obj/computer.dmi'
	density = 1
	anchored = 1.0
	use_power = 1
	idle_power_usage = 300
	active_power_usage = 300
	var/obj/item/weapon/circuitboard/circuit = null //if circuit==null, computer can't disassembly
	var/processing = 0
	var/z_check = 1

/obj/machinery/computer/New(location, var/obj/item/weapon/circuitboard/C)
	..(location)
	if(C && istype(C))
		circuit = C
	else if(ispath(circuit))
		circuit = new circuit(null)
	else if(ispath(text2path(circuit)))
		circuit = text2path(circuit)
		circuit = new circuit(null)

	if(ticker)
		initialize()

/obj/machinery/computer/proc/level_check()
	if(z_check)
		if(!(src.z in vessel_z))
			usr << "\red <b>Unable to establish a connection</b>: \black You're too far away from the [vessel_type]!"
			return 0
	else return 1


/obj/machinery/computer/initialize()
	power_change()

/obj/machinery/computer/process()
	if(stat & (NOPOWER|BROKEN))
		SetLuminosity(0,0,0)
		return 0
	else
		if(!istype(src,/obj/machinery/computer/centrifuge) && !istype(src,/obj/machinery/computer/security/wooden_tv) && !istype(src,/obj/machinery/computer/security/telescreen))
			SetLuminosity(0,0,2)
	return 1

/obj/machinery/computer/meteorhit(var/obj/O as obj)
	for(var/x in verbs)
		verbs -= x
	set_broken()
	var/datum/effect/effect/system/smoke_spread/smoke = new /datum/effect/effect/system/smoke_spread()
	smoke.set_up(5, 0, src)
	smoke.start()
	return


/obj/machinery/computer/emp_act(severity)
	if(prob(20/severity)) set_broken()
	..()


/obj/machinery/computer/ex_act(severity)
	switch(severity)
		if(1.0)
			qdel(src)
			return
		if(2.0)
			if (prob(25))
				qdel(src)
				return
			if (prob(50))
				for(var/x in verbs)
					verbs -= x
				set_broken()
		if(3.0)
			if (prob(25))
				for(var/x in verbs)
					verbs -= x
				set_broken()
		else
	return

/obj/machinery/computer/bullet_act(var/obj/item/projectile/Proj)
	if(prob(Proj.damage))
		set_broken()
	..()


/obj/machinery/computer/blob_act()
	if (prob(75))
		for(var/x in verbs)
			verbs -= x
		set_broken()
		density = 0

/obj/machinery/computer/update_icon()
	..()
	icon_state = initial(icon_state)
	// Broken
	if(stat & BROKEN)
		icon_state += "b"

	// Powered
	else if(stat & NOPOWER)
		icon_state = initial(icon_state)
		icon_state += "0"



/obj/machinery/computer/power_change()
	..()
	update_icon()


/obj/machinery/computer/proc/set_broken()
	stat |= BROKEN
	update_icon()




/obj/machinery/computer/attackby(I as obj, user as mob)
	if(istype(I, /obj/item/weapon/screwdriver) && circuit)
		playsound(src.loc, 'sound/items/Screwdriver.ogg', 50, 1)
		user << "<span class='notice'> You start to disconnect the monitor.</span>"
		if(do_after(user, 20))
			var/obj/structure/computerframe/A = new /obj/structure/computerframe( src.loc )
			A.circuit = circuit
			A.anchored = 1
			circuit = null
			for (var/obj/C in src)
				C.loc = src.loc
			if (src.stat & BROKEN)
				user << "<span class='notice'> The broken glass falls out.</span>"
				new /obj/item/weapon/shard( src.loc )
				A.state = 3
				A.icon_state = "3"
			else
				user << "<span class='notice'> You disconnect the monitor.</span>"
				A.state = 4
				A.icon_state = "4"
			qdel(src)
	return


/obj/machinery/computer/attack_hand(mob/user as mob)
	if(..())
		return 1
	if((src.dir == 1) && (user.y - src.y == 1)) //NORTH
		if(src.x == user.x || src.x - user.x == 1 || user.x - src.x == 1)
			return 0
	else if(src.dir == 2 && src.y - user.y == 1) //SOUTH
		if(src.x == user.x || src.x - user.x == 1 || user.x - src.x == 1)
			return 0
	else if(src.dir == 4 && user.x - src.x == 1) //EAST
		if(src.y == user.y || src.y - user.y == 1 || user.y - src.y == 1)
			return 0
	else if(src.dir == 8 && src.x - user.x == 1) //WEST
		if(src.y == user.y || src.y - user.y == 1 || user.y - src.y == 1)
			return 0
	else
		return 1

/obj/machinery/computer/verb/rotate()
	set name = "Rotate computer"
	set category = "Object"
	set src in oview(1)
	src.dir = turn(src.dir, -90)
	return 1