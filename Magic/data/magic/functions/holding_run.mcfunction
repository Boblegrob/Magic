#say holding run

#Prevent same running every tick
scoreboard players operation @s held_player_weave_index = @s reg_1

#TODO sync everything that is not placed

#Run every placed stand
scoreboard players operation Temp reg_1 = @s player_id
scoreboard players operation Temp reg_2 = @s held_player_weave_index

#First run those with weaves already like usual
execute as @e[tag=target_point,tag=!no_weave] if score @s player_id = Temp reg_1 if score @s player_weave_index = Temp reg_2 run tag @s add holding_run_temp
#We are doing it like this because set_weave_from_player will touch the regs
execute as @e[tag=holding_run_temp] run function magic:pre_weaves
tag @e remove holding_run_temp

#Resetting this as temp will change
scoreboard players operation Temp reg_1 = @s player_id

#Then handle those left without a weave like we do in landed
execute as @e[tag=target_point,tag=no_weave] if score @s player_id = Temp reg_1 run tag @s add holding_run_temp
#We are doing it like this because set_weave_from_player will touch the regs
#sync_weave_from_player is almost identical to set_weave_from_player
execute as @e[tag=holding_run_temp] run function magic:sync_weave_from_player
tag @e remove holding_run_temp