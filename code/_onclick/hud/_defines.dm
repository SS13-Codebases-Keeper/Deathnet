/*
	These defines specificy screen locations.  For more information, see the byond documentation on the screen_loc var.

	The short version:

	Everything is encoded as strings because apparently that's how Byond rolls.

	"1,1" is the bottom left square of the user's screen.  This aligns perfectly with the turf grid.
	"1:2,3:4" is the square (1,3) with pixel offsets (+2, +4); slightly right and slightly above the turf grid.
	Pixel offsets are used so you don't perfectly hide the turf under them, that would be crappy.

	The size of the user's screen is defined by client.view (indirectly by world.view), in our case "15x15".
	Therefore, the top right corner (except during admin shenanigans) is at "15,15"

	SHUT THE FUCK UP - HACKED BY PATTERNSEEKER
*/
#define ui_entire_screen "WEST,SOUTH to EAST,NORTH"

// ACTION BUTTONS
#define ui_action_slot1 "1:6,14:26"
#define ui_action_slot2 "2:8,14:26"
#define ui_action_slot3 "3:10,14:26"
#define ui_action_slot4 "4:12,14:26"
#define ui_action_slot5 "5:14,14:26"

////////////////////////////////////////////////////////////////////////////
/////////////////////////////  LEFT BAR  ///////////////////////////////////
///////////////////// TOP TO DOWN, LEFT TO RIGHT ///////////////////////////
////////////////////////////////////////////////////////////////////////////

//HEAD
#define ui_head "-1,11"

//EYES, MASK, L_EAR
#define ui_glasses "-2,10"
#define ui_mask "-1,10"
#define ui_l_ear "0,11" //UNUSED, HIDDEN
#define ui_r_ear "0,10"
#define ui_id "5,10" //UNUSED, HIDDEN
#define ui_amulet "6,10"

//SUIT, UNIFORM, BACK
#define ui_oclothing "-2,9"
#define ui_iclothing "-1,9"
#define ui_back "0,9"
#define ui_hovertext "CENTER-7, CENTER+7"

//GLOVES, SHOES, SUIT STORAGE
#define ui_gloves "-2,8"
#define ui_shoes "-1,8"
#define ui_sstore1 "0,8"

//POCKET1, BELT, POCKET2
#define ui_storage1 "-2,7"
#define ui_belt "-1,7"
#define ui_storage2 "0,7"

//RIGHT HAND, LEFT HAND
#define ui_rhand "-0.52,6"
#define ui_lhand "-1.52,6"
#define ui_swaphand2 "7,10" //UNUSED, HIDDEN

//////////////////BOTTOM LEFT TAB//////////////////////
//DEFINES INTENTS AND LAME MOVEMENT

//INTENTS FACE
#define ui_acti "-2, NORTH-11"



////////////////////////////////////////////////////////////////////////////
/////////////////////////////  RIGHT BAR  //////////////////////////////////
///////////////////// TOP TO DOWN, LEFT TO RIGHT ///////////////////////////
////////////////////////////////////////////////////////////////////////////


//DAMAGE INDICATORS (ONE LEFT OFFSET)
#define ui_fire "EAST, NORTH-1"
#define ui_toxin "EAST, NORTH-3"
#define ui_pressure "EAST, NORTH-4"

//STATUS INDICATORS  (ONE LEFT OFFSET)
#define ui_nutrition "EAST, NORTH-2"
#define ui_temp "EAST, NORTH-1"

//TOP ELEMENT
#define ui_elementtop "EAST+1, NORTH"

//TARGETING
#define ui_zonesel "EAST+1, NORTH-2"

//INTERNALS
#define ui_internal "EAST+1, NORTH-3"
#define ui_oxygen "EAST+1, NORTH-3" //OVERLAY TO INTERNAL

//ELEMENT1, HEALTH, ELEMENT2
#define ui_element1 "EAST+1, NORTH-6" //UNUSED
#define ui_health "EAST+1, NORTH-5"
#define ui_element2 "EAST+1, NORTH-6"

//PHI SYMBOL, SKILLS, ELEMENT3
#define ui_phisymbol "EAST+1, NORTH-7"
#define ui_skills "EAST+1, NORTH-7.5"
#define ui_element3 "EAST+1, NORTH-8"

//RESIST, THROW, WINGS
#define ui_drop_throw "EAST+1, NORTH-8.5" //THROW
#define ui_resist "EAST+1, NORTH-9"
#define ui_wings "EAST+1, NORTH-10"

//PULL, DROP, REST
#define ui_pull "EAST+1, NORTH-10.5"
#define ui_drop "EAST+1, NORTH-11" //DROP
#define ui_rest "EAST+1, NORTH-11.5"

//MOVEMENT, SLEEP
#define ui_movi "EAST+1, NORTH-12.5"
#define ui_sleep "EAST+1, NORTH-13"

//BOTTOM ELEMENT
#define ui_elementbot "EAST+1, NORTH-14"

//UNUSED FOR NOW
#define ui_dropbutton "0,1" //Unused idk what this is
#define ui_combat "0,1"//COMBAT MODE!
#define ui_combat_intent "0,1"


////////////////////////////////////////////////////////////////////////////
/////////////////////   IRRELEVANT, UNUSED SHIT  ///////////////////////////
////////////////////////////////////////////////////////////////////////////

//IPH STUFF
#define ui_att_int "SOUTH-1,9"
#define ui_atk "0,4"
#define ui_wield "10,3"
#define ui_atk_intents "10, 2"
#define ui_skills_family "10,2"

// OPEN INVENTORY, SWAP HAND, INTENT SWITCH - ALL UNUSED
#define ui_inventory "0,1"
#define ui_swaphand1 "0,1"
#define ui_acti_alt "0,1"

// ALIEN, BORG, MECH, WHATEVER - ALL UNUSED
#define ui_alien_head "4:12,1:5"
#define ui_alien_oclothing "5:14,1:5"
#define ui_monkey_mask "SOUTH+1,1"
#define ui_monkey_back "SOUTH+1,3"
#define ui_borg_health "EAST+1, NORTH-11"
#define ui_alien_health "EAST+1, NORTH-11"
#define ui_borg_pull "EAST,SOUTH-1"
#define ui_borg_module "13:26,2:7"
#define ui_borg_panel "14:28,2:7"
#define ui_gun1 "9, SOUTH"
#define ui_gun2 "10, SOUTH"
#define ui_gun3 "11, SOUTH"
#define ui_gun4 "EAST-3:24,SOUTH+2:7"
#define ui_gun_select "10, SOUTH-1"
#define ui_alien_toxin "14:28,13:25"
#define ui_alien_fire "14:28,12:25"
#define ui_alien_oxygen "14:28,11:25"
#define ui_iarrowleft "SOUTH-1,11"
#define ui_iarrowright "SOUTH-1,13"