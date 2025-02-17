scoreboard players operation Temp reg_1 = @s player_id
execute store result score Temp reg_2 run data get entity @s SelectedItem.components.minecraft:custom_data.Player_weave_index
execute as @e[tag=target_point,tag=actively_held] if score @s weave_owner_player_id = Temp reg_1 if score @s player_weave_index = Temp reg_2 run tag @s add new_ray_multi_blocked_temp

scoreboard players operation Ray_data reg_1 = @s player_id
scoreboard players operation Ray_data reg_4 = @s current_held
scoreboard players operation Ray_data reg_4 /= 10 reg_1
scoreboard players set Ray_data reg_2 1
scoreboard players set Ray_data reg_3 0

execute unless entity @e[tag=new_ray_multi_blocked_temp] positioned ^ ^2 ^1 run function magic:ray_iteration
execute unless entity @e[tag=new_ray_multi_blocked_temp] run playsound minecraft:entity.item.pickup player @s

tag @e remove new_ray_multi_blocked_temp
scoreboard players set @s click 0