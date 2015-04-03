/obj/item/weapon/storage/box/first_aid_kit
	name = "Survival kit"
	desc = "Gives you a chance not to die in first five minutes of combat"
	icon_state = "implant"

/obj/item/weapon/storage/box/first_aid_kit/New()
	..()
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
	..()
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
	..()
	new /obj/item/weapon/plastique(src)
	new /obj/item/weapon/plastique(src)
	new /obj/item/weapon/plastique(src)
	new /obj/item/weapon/plastique(src)

/obj/item/taperoll/barbwire
	name = "coil of barbwire"
	icon = 'icons/vyetnam.dmi'
	icon_state = "barbwire_start"
	tape_type = /obj/item/tape/barbwire
	icon_base = "barbwire"

/obj/item/tape/barbwire
	name = "barbwire"
	icon = 'icons/vyetnam.dmi'
	anchored = 1
	density = 0
	icon_state = "barbwire_h"
	icon_base = "barbwire"

/obj/item/tape/barbwire/Crossed(atom/movable/obj,atom/oldLoc)
	. = ..()
	if(!ishuman(obj))
		return
	var/mob/living/carbon/human/H = obj

	H << "<span class='danger'>You cut yourself by [src].</span>"
	H.adjustBruteLossByPart(10, pick("r_leg", "l_leg", "r_foot", "l_foot"))

	if(prob(75))
		H << "You stuck in [src] a bit."
		H.Stun(2)
		H.canmove = 0
	else if(prob(75))
		H << "You really stuck in [src]."
		H.Stun(6)
		H.canmove = 0

/obj/item/tape/barbwire/attack_hand(mob/user)
	if(!ishuman(user))
		return ..()
	var/mob/living/carbon/human/H = user
	if((H.gloves && prob(10)) || (!H.gloves && prob(60)))
		H << "<span class='danger'>You cut yourself by [src]</span>"
		H.adjustBruteLossByPart(10, (H.hand) ? "l_arm" : "r_arm")

/obj/item/tape/barbwire/attackby(obj/item/W, mob/user)
	if(!istype(W, /obj/item/weapon/wirecutters))
		return ..()
	user << "You start cutting [src]"
	user.show_viewers("\red [user] starts cutting the [src]!")

	if(!do_after(user, 7))
		return

	user << "You cut [src] by [W]."
	user.show_viewers("\red [user] cuts the [src]!")
	del(src)

/obj/structure/bushes
	icon = 'icons/obj/plants.dmi'
	icon_state = "gplant_1"
	density = 0
	opacity = 0
	layer = 5

	New()
		icon_state = "gplant_[rand(1, 10)]"

/obj/item/weapon/reagent_containers/food/drinks/flask/marine
	icon_state = "flask"
	volume = 40

	New()
		..()
		reagents.add_reagent("water", 40)

