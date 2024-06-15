/obj/item/projectile/bullet
	name = "bullet"
	icon_state = "bullet"
	damage = 60
	damage_type = BRUTE
	nodamage = 0
	flag = "bullet"
	embed = 1
	muzzle_type = /obj/effect/projectile/bullet/muzzle

	on_hit(var/atom/target, var/blocked = 0)
		if (..(target, blocked))
			var/mob/living/L = target
			shake_camera(L, 3, 2)

/obj/item/projectile/bullet/weakbullet
	damage = 10
	stun = 8
	weaken = 8
	embed = 0

/obj/item/projectile/bullet/midbullet
	damage = 44
	stun = 6
	weaken = 8

/obj/item/projectile/bullet/midbullet2
	damage = 50

/obj/item/projectile/bullet/suffocationbullet//How does this even work?
	name = "co bullet"
	damage = 20
	damage_type = OXY


/obj/item/projectile/bullet/cyanideround
	name = "poison bullet"
	damage = 40
	damage_type = TOX


/obj/item/projectile/bullet/burstbullet//I think this one needs something for the on hit
	name = "exploding bullet"
	damage = 20
	embed = 0
	edge = 1


/obj/item/projectile/bullet/stunshot
	name = "stunshot"
	damage = 5
	stun = 15
	weaken = 10
	stutter = 10
	embed = 0

/obj/item/projectile/bullet/rubber
	damage = 15
	stun = 10
	weaken = 10
	embed = 0

/obj/item/projectile/bullet/SW
	damage = 35
	stun = 15
	weaken = 15

/obj/item/projectile/bullet/a762
	damage = 25

/obj/item/projectile/bullet/beretta
	damage = 27

//DEATHNET BULLETS

/obj/item/projectile/bullet/sludge
	damage = 50

/obj/item/projectile/bullet/a455
	damage = 60
	stun = 10

/obj/item/projectile/bullet/a8mm
	damage = 20

/obj/item/projectile/bullet/a8mag
	damage = 40
	stun = 5

/obj/effect/projectile
	icon = 'icons/obj/projectiles.dmi'
	icon_state = "bolt"

/obj/effect/projectile/proc/set_transform(var/matrix/M)
	if(istype(M))
		transform = M

/obj/effect/projectile/bullet/muzzle
	icon_state = "muzzle_bullet"