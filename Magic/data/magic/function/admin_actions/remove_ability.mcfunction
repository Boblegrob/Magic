scoreboard players set @s remove_ability 0
scoreboard players enable @s[tag=admin] remove_ability

scoreboard players operation Temp reg_1 = @s select_player
execute as @a if score @s player_id = Temp reg_1 run tag @s remove can_see
execute as @a if score @s player_id = Temp reg_1 run tag @s remove can_use
execute as @a if score @s player_id = Temp reg_1 run function magic:power_handling/exit