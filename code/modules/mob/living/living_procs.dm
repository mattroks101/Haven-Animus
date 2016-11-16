/mob/living

  //TODO: Add vimpaired, blurry and druggy
  proc/handle_hud_vision()
    if (stat != DEAD)
      if (blind)
        blind.alpha = blinded ? 255 : 0
    else
      reset_hud_vision()

  proc/reset_hud_vision()
    if (blind)
      blind.alpha = 0
