/obj/item/weapon/storage/box/first_aid_kit
	name = "Survival kit"
	desc = "Gives you a chance not to die in first five minutes of combat"
	icon_state = "implant"

/obj/item/weapon/storage/box/first_aid_kit/New()
	new /obj/item/weapon/reagent_containers/hypospray/medipen/combat(src)
	new /obj/item/stack/medical/bruise_pack(src)
	new /obj/item/stack/medical/ointment(src)

/obj/item/weapon/storage/surgery_tools_case
	name = "Surgery Tools Case"
	desc = "Oh god he is bleeding! Someone help!"
	icon_state = "medbriefcase"
	storage_slots = 14
	max_combined_w_class = 18 //All surgery tools fits perfectly but left no more space

/obj/item/weapon/storage/surgery_tools_case/New()
	new /obj/item/weapon/circular_saw(src)
	new /obj/item/weapon/FixOVein(src)
	new /obj/item/weapon/bonegel(src)
	new /obj/item/weapon/bonesetter(src)
	new /obj/item/weapon/scalpel(src)
	new /obj/item/weapon/surgicaldrill(src)
	new /obj/item/weapon/cautery(src)
	new /obj/item/weapon/hemostat(src)
	new /obj/item/weapon/retractor(src)

/obj/item/weapon/storage/box/explosive_kit
	name = "Explosive kit"
	desc = "Age limit: 3+"
	icon_state = "mousetraps"

/obj/item/weapon/storage/box/explosive_kit/New()
	new /obj/item/weapon/plastique(src)
	new /obj/item/weapon/plastique(src)
	new /obj/item/weapon/plastique(src)
	new /obj/item/weapon/plastique(src)