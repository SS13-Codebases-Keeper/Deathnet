/obj/machinery
    var/dn_comrade_only = TRUE

/obj/machinery/attack_hand(mob/user as mob)
    if(dn_comrade_only)
        if(!is_dn_whitelisted(user.client))
            user << "<span class='danger'><b>INTERACTION DENIED - YOUR ACCESS LEVEL IS NOT HIGH ENOUGH.</b></span>"
            return FALSE
    return ..()