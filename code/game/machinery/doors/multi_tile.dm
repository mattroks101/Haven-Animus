//Terribly sorry for the code doubling, but things go derpy otherwise.
/obj/machinery/door/airlock/multi_tile
	width = 2

/obj/machinery/door/airlock/multi_tile/glass
	name = "Glass Airlock"
	icon = 'icons/obj/doors/Door2x1glass.dmi'
	opacity = 0
	glass = 1
	assembly_type = "obj/structure/door_assembly/multi_tile"


/obj/machinery/door/airlock/multi_tile/metal
	name = "Airlock"
	icon = 'icons/obj/doors/Door2x1metal.dmi'
	assembly_type = "obj/structure/door_assembly/multi_tile"


	New()
		..()

		if(src.dir > 3)
			f5 = new/obj/machinery/door/airlock/multi_tile/filler_object (src.loc)
			f6 = new/obj/machinery/door/airlock/multi_tile/filler_object (get_step(src,EAST))
		else
			f5 = new/obj/machinery/door/airlock/multi_tile/filler_object (src.loc)
			f6 = new/obj/machinery/door/airlock/multi_tile/filler_object (get_step(src,NORTH))
		f5.density = 0
		f6.density = 0
		f5.SetOpacity(opacity)
		f6.SetOpacity(opacity)

	Destroy()
		del f5
		del f6
		..()

/obj/machinery/door/airlock/multi_tile/filler_object
	name = ""
	icon = 'icons/obj/doors/rapid_pdoor.dmi'
	icon_state = ""
	density = 0


