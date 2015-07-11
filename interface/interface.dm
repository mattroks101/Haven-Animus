//Please use mob or src (not usr) in these procs. This way they can be called in the same fashion as procs.
/client/verb/wiki()
	set name = "wiki"
	set desc = "Visit the wiki."
	set hidden = 1
	if( config.wikiurl )
		if(alert("Это действие откроет страницу вики в вашем браузере. Вы хотите этого?",,"Да.","Нет.")=="Нет.")
			return
		src << link(config.wikiurl)
	else
		src << "\red URL вики не определен в настройках сервера, извините."
	return

/client/verb/forum()
	set name = "forum"
	set desc = "Visit the forum."
	set hidden = 1
	if( config.forumurl )
		if(alert("Это действие откроет страницу форума в вашем браузере. Вы хотите этого?",,"Да.","Нет.")=="Нет.")
			return
		src << link(config.forumurl)
	else
		src << "\red URL форума не определен в настройках сервера, извините."
	return

#define RULES_FILE "config/rules.html"
/client/verb/rules()
	set name = "Rules"
	set desc = "Show Server Rules."
	set hidden = 1
	src << browse(file(RULES_FILE), "window=rules;size=480x320")
#undef RULES_FILE

/client/verb/hotkeys_help()
	set name = "hotkeys-help"
	set category = "OOC"

	var/hotkey_mode = {"<font color='purple'>
Hotkey-Mode: (hotkey-mode must be on)
\tTAB = включить или выключить режим горячих клавиш
\ta = left(влево)
\ts = down(вниз)
\td = right(вправо)
\tw = up(вверх)
\tq = drop(уронить)
\te = equip(надеть)
\tr = throw(кинуть)
\tt = say(сказать)
\tx = swap-hand(поменять руку)
\tz = activate held object (активировать предмет в руке)
\tf = cycle-intents-left
\tg = cycle-intents-right
\t1 = help-intent
\t2 = disarm-intent
\t3 = grab-intent
\t4 = harm-intent
</font>"}

	var/other = {"<font color='purple'>
Any-Mode: (hotkey doesn't need to be on)
\tCtrl+a = left
\tCtrl+s = down
\tCtrl+d = right
\tCtrl+w = up
\tCtrl+q = drop
\tCtrl+e = equip
\tCtrl+r = throw
\tCtrl+x = swap-hand
\tCtrl+z = activate held object (or Ctrl+y)
\tCtrl+f = cycle-intents-left
\tCtrl+g = cycle-intents-right
\tCtrl+1 = help-intent
\tCtrl+2 = disarm-intent
\tCtrl+3 = grab-intent
\tCtrl+4 = harm-intent
\tDEL = pull
\tINS = cycle-intents-right
\tHOME = drop
\tPGUP = swap-hand
\tPGDN = activate held object
\tEND = throw
</font>"}

	var/admin = {"<font color='purple'>
Admin:
\tF5 = Aghost (admin-ghost)
\tF6 = player-panel-new
\tF7 = admin-pm
\tF8 = Invisimin
</font>"}

	src << hotkey_mode
	src << other
	if(holder)
		src << admin
