/obj/machinery/door/attack_hand(mob/user as mob)
    if(dn_comrade_only)
        if(is_dn_whitelisted(client))
            user.client >> "<span class='danger'><b>ENTRY DENIED - YOUR ACCESS LEVEL IS NOT HIGH ENOUGH</b></span>"
            return FALSE
    return ..()