tag @s add current_weave_for_log
execute if score magic_settings magic_debug_state matches 2 run function magic:debug/console_write_executed
tag @s remove current_weave_for_log

tag @s add current_target

function magic:calculate_distance

#Remove truly_see from all but self if inverted
scoreboard players operation Temp reg_1 = @s player_id
execute as @s[tag=inverted] as @a[tag=truly_see] unless score @s player_id = Temp reg_1 run tag @s remove truly_see

function magic:print_weave_composition

#Weaves directed at a person will be locked directly when it land and can be accesed with weave_locked_player_id

tag @s[tag=current_target,tag=unused] add hold_used

#TODO save in specific counts like old days? (air_count,...)

#Air
scoreboard players set Temp reg_1 1
function magic:weave_processing/count_weave_single
scoreboard players operation @s weave_air_count = @s reg_1

#Earth
scoreboard players set Temp reg_1 2
function magic:weave_processing/count_weave_single
scoreboard players operation @s weave_earth_count = @s reg_1

#Fire
scoreboard players set Temp reg_1 3
function magic:weave_processing/count_weave_single
scoreboard players operation @s weave_fire_count = @s reg_1

#Water
scoreboard players set Temp reg_1 4
function magic:weave_processing/count_weave_single
scoreboard players operation @s weave_water_count = @s reg_1

#Spirit
scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single
scoreboard players operation @s weave_spirit_count = @s reg_1

#Adjust according to other

#Explosion
scoreboard players set Temp reg_1 2
scoreboard players set Temp reg_2 3
function magic:weave_processing/count_weave_double
scoreboard players operation @s weave_explosion_count = @s reg_1

scoreboard players operation @s weave_earth_count -= @s weave_explosion_count
scoreboard players operation @s weave_fire_count -= @s weave_explosion_count

#Lightning
scoreboard players set Temp reg_1 3
scoreboard players set Temp reg_2 1
function magic:weave_processing/count_weave_double
scoreboard players operation @s weave_lightning_count = @s reg_1

scoreboard players operation @s weave_fire_count -= @s weave_lightning_count
scoreboard players operation @s weave_air_count -= @s weave_lightning_count

#Ice
scoreboard players set Temp reg_1 3
scoreboard players set Temp reg_2 4
function magic:weave_processing/count_weave_double
scoreboard players operation @s weave_ice_count = @s reg_1

scoreboard players operation @s weave_fire_count -= @s weave_ice_count
scoreboard players operation @s weave_water_count -= @s weave_ice_count


#Extinguish
scoreboard players set Temp reg_1 1
scoreboard players set Temp reg_2 4
function magic:weave_processing/count_weave_double
scoreboard players operation @s weave_extinguish_count = @s reg_1

scoreboard players operation @s weave_air_count -= @s weave_extinguish_count
scoreboard players operation @s weave_water_count -= @s weave_extinguish_count

#Dry
scoreboard players set Temp reg_1 3
scoreboard players set Temp reg_2 3
scoreboard players set Temp reg_3 4
function magic:weave_processing/count_weave_tripple
scoreboard players operation @s weave_dry_count = @s reg_1

scoreboard players operation @s weave_fire_count -= @s weave_dry_count
scoreboard players operation @s weave_fire_count -= @s weave_dry_count
scoreboard players operation @s weave_water_count -= @s weave_dry_count

scoreboard players operation @s weave_ice_count -= @s weave_dry_count

#Cutting
scoreboard players set Temp reg_1 5
scoreboard players set Temp reg_2 3
scoreboard players set Temp reg_3 2
function magic:weave_processing/count_weave_tripple
scoreboard players operation @s weave_cut_count = @s reg_1

scoreboard players operation @s weave_spirit_count -= @s weave_cut_count
scoreboard players operation @s weave_fire_count -= @s weave_cut_count
scoreboard players operation @s weave_earth_count -= @s weave_cut_count

#Healing
scoreboard players set Temp reg_1 1
scoreboard players set Temp reg_2 5
scoreboard players set Temp reg_3 4
function magic:weave_processing/count_weave_tripple
scoreboard players operation @s weave_heal_count = @s reg_1

scoreboard players operation @s weave_air_count -= @s weave_heal_count
scoreboard players operation @s weave_spirit_count -= @s weave_heal_count
scoreboard players operation @s weave_water_count -= @s weave_heal_count

#Needs to be below all primary detections
function magic:weave_processing/advance_read_index


#Secondary detection
scoreboard players set @s weave_fire_count_1 0
scoreboard players set Temp reg_1 3
function magic:weave_processing/count_weave_single
scoreboard players operation @s weave_fire_count_1 = @s reg_1

scoreboard players set @s weave_spirit_count_1 0
scoreboard players set Temp reg_1 5
function magic:weave_processing/count_weave_single
scoreboard players operation @s weave_spirit_count_1 = @s reg_1

#Execute them
scoreboard players operation Temp reg_1 = @s weave_fire_count
function magic:math/square_root
scoreboard players remove Temp reg_1 1
execute store result storage magic:weave_size size int 1 run scoreboard players get Temp reg_1
execute at @s[scores={weave_fire_count=4..}] run function magic:base_weaves/weave_fire with storage magic:weave_size
execute at @s[scores={weave_fire_count=1}] run function magic:base_weaves/weave_fire with storage magic:weave_size

#Earth
scoreboard players operation Temp reg_1 = @s weave_earth_count
function magic:math/cube_root
scoreboard players remove Temp reg_1 1
execute store result storage magic:weave_size size int 1 run scoreboard players get Temp reg_1
execute at @s[scores={weave_earth_count=1..}] unless score @s weave_earth_count = @s weave_fire_count_1 run function magic:base_weaves/weave_earth with storage magic:weave_size

#Water
scoreboard players operation Temp reg_1 = @s weave_water_count
function magic:math/cube_root
scoreboard players remove Temp reg_1 1
execute store result storage magic:weave_size size int 1 run scoreboard players get Temp reg_1
execute at @s[scores={weave_water_count=1..}] run function magic:base_weaves/weave_water with storage magic:weave_size

#Explosion
execute store result storage magic:weave_size size int 1 run scoreboard players get @s weave_explosion_count
execute at @s[scores={weave_explosion_count=1..}] run function magic:base_weaves/weave_explosion with storage magic:weave_size

#Lightning
execute store result storage magic:weave_size size int 1 run scoreboard players get @s weave_lightning_count
execute at @s[scores={weave_lightning_count=1..}] run function magic:base_weaves/weave_lightning with storage magic:weave_size

#Cutting
execute store result storage magic:weave_size size int 1 run scoreboard players get @s weave_cut_count
execute at @s[scores={weave_cut_count=1..}] run function magic:base_weaves/weave_cut with storage magic:weave_size

#Ice
scoreboard players operation Temp reg_1 = @s weave_ice_count
function magic:math/cube_root
scoreboard players remove Temp reg_1 1
execute store result storage magic:weave_size size int 1 run scoreboard players get Temp reg_1
execute at @s[scores={weave_ice_count=1..}] run function magic:base_weaves/weave_ice with storage magic:weave_size

#Extinguish
scoreboard players operation Temp reg_1 = @s weave_extinguish_count
function magic:math/square_root
scoreboard players remove Temp reg_1 1
execute store result storage magic:weave_size size int 1 run scoreboard players get Temp reg_1
execute at @s[scores={weave_extinguish_count=1..}] run function magic:base_weaves/weave_extinguish with storage magic:weave_size

#Dry
scoreboard players operation Temp reg_1 = @s weave_dry_count
function magic:math/square_root
scoreboard players remove Temp reg_1 1
execute store result storage magic:weave_size size int 1 run scoreboard players get Temp reg_1
execute at @s[scores={weave_dry_count=1..}] run function magic:base_weaves/weave_dry with storage magic:weave_size

#Healing
scoreboard players operation Temp reg_1 = @s weave_heal_count
execute store result storage magic:weave_size size int 1 run scoreboard players get Temp reg_1
execute at @s[scores={weave_heal_count=1..}] run function magic:base_weaves/weave_heal with storage magic:weave_size

#Fireball
execute as @s[scores={weave_air_count=0,weave_earth_count=0,weave_fire_count=2,weave_water_count=0,weave_spirit_count=0}] run function magic:base_weaves/weave_fireball_pre

#Fireball throw
execute as @s[scores={weave_air_count=0,weave_earth_count=0,weave_fire_count=3,weave_water_count=0,weave_spirit_count=0}] run function magic:base_weaves/weave_launch_fireball_pre

#Stun
execute as @s[scores={weave_air_count=0,weave_earth_count=0,weave_fire_count=0,weave_water_count=0,weave_spirit_count=2}] run function magic:base_weaves/weave_stun_pre

#Shield
execute as @s[scores={weave_air_count=0,weave_earth_count=0,weave_fire_count=0,weave_water_count=0,weave_spirit_count=3,weave_spirit_count_1=1}] run function magic:base_weaves/weave_shield

#Throw
execute as @s[scores={weave_air_count=3,weave_earth_count=0,weave_fire_count=0,weave_water_count=0}] run function magic:base_weaves/weave_throw

#Bind
execute as @s[scores={weave_air_count=4,weave_earth_count=0,weave_fire_count=0,weave_water_count=0}] run function magic:base_weaves/weave_bind

#Fireball land
#A weave_read_index = 0 would signify that we hit the end, and thus re-read the first line again
execute as @s[scores={weave_read_index=1..,weave_fire_count=1..}] if score @s weave_fire_count = @s weave_fire_count_1 store result storage magic:weave_size size int 1 run scoreboard players get @s weave_fire_count
execute as @s[scores={weave_read_index=1..,weave_fire_count=1..}] if score @s weave_fire_count = @s weave_fire_count_1 run function magic:base_weaves/weave_land_fireball with storage magic:weave_size

#Severing
#A weave_read_index = 0 would signify that we hit the end, and thus re-read the first line again
execute as @s[scores={weave_read_index=1..,weave_spirit_count=1..}] if score @s weave_spirit_count = @s weave_spirit_count_1 store result storage magic:weave_size size int 1 run scoreboard players get @s weave_spirit_count_1
execute as @s[scores={weave_read_index=1..,weave_spirit_count=1..}] if score @s weave_spirit_count = @s weave_spirit_count_1 run function magic:base_weaves/weave_sever with storage magic:weave_size

#Resistance
#A weave_read_index = 0 would signify that we hit the end, and thus re-read the first line again
execute as @s[scores={weave_read_index=1..,weave_earth_count=1..}] if score @s weave_earth_count = @s weave_fire_count_1 store result storage magic:weave_size size int 1 run scoreboard players get @s weave_earth_count
execute as @s[scores={weave_read_index=1..,weave_earth_count=1..}] if score @s weave_earth_count = @s weave_fire_count_1 run function magic:base_weaves/weave_resistance with storage magic:weave_size

#Masking ability
execute as @s[scores={weave_read_index=1..,weave_spirit_count=9,weave_spirit_count_1=10}] run function magic:base_weaves/weave_mask_ability

#Inverting
execute as @s[scores={weave_read_index=1..,weave_spirit_count=5,weave_spirit_count_1=4}] run function magic:base_weaves/weave_invert

#Invisibility
execute as @s[scores={weave_read_index=1..,weave_air_count=2,weave_fire_count_1=3}] run function magic:base_weaves/weave_invisibility

#Travel
execute as @s[scores={weave_read_index=1..,weave_spirit_count=6..}] if score @s weave_spirit_count = @s weave_fire_count_1 run function magic:base_weaves/weave_travel


#Using @e if by some chance we get more than 1 (server stop?)
tag @e remove current_target