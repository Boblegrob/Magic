execute as @s[tag=circled] run function magic:exit
tag @s[tag=circled] remove can_use
tag @s[tag=circled] remove can_see
kill @s[tag=circled]
tag @s[tag=circled] remove circled
scoreboard players set @s leave_detect 0

function magic:detect_op
tag @s[tag=op_detected] add magic_admin
tellraw @s[tag=op_detected] {"text":"Welcome admin!","bold":true,"color":"gold"}
tellraw @s[tag=!op_detected,tag=magic_admin] {"text":"Welcome admin!","bold":true,"color":"gold"}
tag @s[tag=op_detected] remove op_detected

#Enable
scoreboard players enable @s[tag=magic_admin] magic_admin
scoreboard players enable @s[tag=magic_admin] select_player
scoreboard players enable @s[tag=magic_admin] magic_debug_state
scoreboard players enable @s[tag=magic_admin] magic_remove_ability
scoreboard players enable @s[tag=magic_admin] magic_re_add_ability
scoreboard players enable @s[tag=magic_admin] magic_give_book
scoreboard players enable @s[tag=magic_admin] magic_add_ability
scoreboard players enable @s[tag=magic_admin] set_halve_hold
scoreboard players enable @s[tag=magic_admin] set_regenerated

#Reset all these so math works
scoreboard players add @s regenerated_strenght 0

#Level should be one normaly
scoreboard players add @s angreal_level 0
execute as @s if score @s angreal_level matches 0 run scoreboard players set @s angreal_level 1

scoreboard players add @s t_1 0
scoreboard players add @s t_2 0
scoreboard players add @s t_3 0
scoreboard players add @s t_4 0
scoreboard players add @s t_5 0
scoreboard players add @s t_6 0
scoreboard players add @s t_7 0
scoreboard players add @s t_8 0
scoreboard players add @s t_9 0
scoreboard players add @s t_10 0
scoreboard players add @s t_11 0
scoreboard players add @s t_12 0
scoreboard players add @s t_13 0
scoreboard players add @s t_14 0
scoreboard players add @s t_15 0
scoreboard players add @s t_16 0
scoreboard players add @s t_17 0
scoreboard players add @s t_18 0
scoreboard players add @s t_19 0
scoreboard players add @s t_20 0

scoreboard players add @s stage 0

scoreboard players add @s invert 0
scoreboard players add @s disguise 0
scoreboard players add @s shilded 0
scoreboard players add @s progressive_shielded 0

execute unless score @s use_items matches -2147483647.. run scoreboard players set @s use_items 1