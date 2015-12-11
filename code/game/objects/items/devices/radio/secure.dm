/obj/item/device/radio/security
	name = "security radio"
	icon_state = "walkietalkie"
	freerange = 1
	frequency = 1359

/obj/item/device/radio/security/Topic(href, href_list)
	href_list["freq"] = null
	return ..(href, href_list)