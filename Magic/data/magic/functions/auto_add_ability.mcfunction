tag @s add can_use
tag @s add can_see

#Get possible difference
scoreboard players operation @s reg_2 = magic_settings magic_max_strength
scoreboard players operation @s reg_2 -= magic_settings magic_min_strength

execute store result score @s reg_1 run random value 1..5000
execute store result storage get_normal_distributed_index index int 1 run scoreboard players get @s reg_1

function magic:get_normal_distributed with storage minecraft:get_normal_distributed_index

scoreboard players operation @s reg_2 *= @s reg_1

scoreboard players operation @s reg_2 /= 100 reg_1

scoreboard players operation @s reg_2 += magic_settings magic_min_strength
scoreboard players operation @s halve_amount_hold = @s reg_2

#This gives about 5 minutes at halve
scoreboard players operation @s max_regenerated_strength = @s halve_amount_hold
scoreboard players operation @s max_regenerated_strength *= 10 reg_1
scoreboard players operation @s max_regenerated_strength *= 5 reg_1
scoreboard players operation @s max_regenerated_strength *= 60 reg_1
scoreboard players operation @s regenerated_strength = @s max_regenerated_strength