#To be run as the item frame either in beginning or end

#Base
execute unless data entity @s Item.components.minecraft:custom_data.Angreal_base run tag @s add create_angreal_base_temp
execute as @s[tag=create_angreal_base_temp] run playsound minecraft:block.anvil.place ambient @a[distance=..10,tag=can_see]
execute as @s[tag=create_angreal_base_temp] run data modify entity @s Item.components.minecraft:custom_data merge value {Power_sinked:0}
execute as @s[tag=create_angreal_base_temp] run data modify entity @s Item.components.minecraft:custom_data merge value {Angreal_base:1}

tag @s remove create_angreal_base_temp


#Top
execute store result score @s reg_1 run data get entity @s Item.components.minecraft:custom_data.Power_sinked
scoreboard players operation @s reg_2 = @s reg_1
scoreboard players operation @s reg_1 /= 10000 reg_1
scoreboard players operation @s reg_3 = @s reg_1
scoreboard players operation @s reg_3 *= 10000 reg_1
scoreboard players operation @s reg_2 -= @s reg_3
execute if score @s reg_1 matches 1.. run tag @s add create_angreal_top_temp

#execute as @s[tag=create_angreal_top_temp,scores={reg_2=0}] run say not flawed
#execute as @s[tag=create_angreal_top_temp,scores={reg_2=1..}] run say flawed

execute as @s[tag=create_angreal_top_temp,scores={reg_2=0}] run data modify entity @s Item.components.minecraft:custom_data merge value {Angreal_flawed:0}
execute as @s[tag=create_angreal_top_temp,scores={reg_2=1..}] run data modify entity @s Item.components.minecraft:custom_data merge value {Angreal_flawed:1}

execute as @s[tag=create_angreal_top_temp] run playsound minecraft:block.anvil.place ambient @a[distance=..10,tag=can_see]
execute as @s[tag=create_angreal_top_temp] run data modify entity @s Item.components.minecraft:custom_data merge value {Angreal_top:1}
execute as @s[tag=create_angreal_top_temp] run data modify entity @s Item.components.minecraft:custom_data merge value {Enchantments:[{}]}
execute as @s[tag=create_angreal_top_temp] run data modify entity @s Item.components.minecraft:custom_data merge value {Amplification:0}
execute as @s[tag=create_angreal_top_temp] store result entity @s Item.components.minecraft:custom_data.Amplification int 1 run scoreboard players get @s reg_1

tag @s remove create_angreal_top_temp
