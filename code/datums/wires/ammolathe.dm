/datum/wires/ammolathe
	holder_type = /obj/machinery/ammolathe
	wire_count = 10

/datum/wires/ammolathe/GetInteractWindow()
	var/obj/machinery/ammolathe/A = holder
	. += ..()
	. += text("<BR>The red light is [A.disabled ? "off" : "on"].<BR>The green light is [A.shocked ? "off" : "on"].<BR>")

/datum/wires/ammolathe/CanUse()
	var/obj/machinery/ammolathe/A = holder
	if(A.panel_open)
		return 1
	return 0

/datum/wires/ammolathe/Interact(var/mob/living/user)
	if(CanUse(user))
		var/obj/machinery/ammolathe/V = holder
		V.attack_hand(user)

/datum/wires/ammolathe/UpdateCut(index, mended)
	var/obj/machinery/ammolathe/A = holder
	switch(index)
		if(AUTOLATHE_SHOCK_WIRE)
			A.shocked = !mended
		if(AUTOLATHE_DISABLE_WIRE)
			A.disabled = !mended

/datum/wires/ammolathe/UpdatePulsed(index)
	if(IsIndexCut(index))
		return
	var/obj/machinery/ammolathe/A = holder
	switch(index)
		if(AUTOLATHE_SHOCK_WIRE)
			A.shocked = !A.shocked
			spawn(50)
				if(A && !IsIndexCut(index))
					A.shocked = 0
					Interact(usr)
		if(AUTOLATHE_DISABLE_WIRE)
			A.disabled = !A.disabled
			spawn(50)
				if(A && !IsIndexCut(index))
					A.disabled = 0
					Interact(usr)