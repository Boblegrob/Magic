#Clear old
scoreboard players operation Temp reg_1 = @s player_id
execute as @e[type=minecraft:chest_minecart,name=hotbar_storage] if score @s player_id = Temp reg_1 run kill @s

execute at @s run summon chest_minecart ~ ~ ~ {CustomName:'{"text":"hotbar_storage"}', Invulnerable:1b, Tags:["current_storage"], NoGravity:1}
execute at @s run scoreboard players operation @e[limit=1,sort=nearest,type=minecraft:chest_minecart,name=hotbar_storage] player_id = @s player_id
execute at @s run scoreboard players operation @e[limit=1,sort=nearest,type=minecraft:chest_minecart,name=hotbar_storage] weave_execute_random_number = Temp reg_2
execute at @s in minecraft:overworld run tp @e[limit=1,sort=nearest,type=minecraft:chest_minecart,name=hotbar_storage] 0 -80 0

#Copy bar
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage] container.0 from entity @s hotbar.0
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage] container.1 from entity @s hotbar.1
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage] container.2 from entity @s hotbar.2
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage] container.3 from entity @s hotbar.3
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage] container.4 from entity @s hotbar.4
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage] container.5 from entity @s hotbar.5
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage] container.6 from entity @s hotbar.6
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage] container.7 from entity @s hotbar.7
item replace entity @e[type=minecraft:chest_minecart, limit=1, tag=current_storage] container.8 from entity @s hotbar.8

tag @e[sort=nearest,type=minecraft:chest_minecart,name=hotbar_storage, tag=current_storage] remove current_storage

#Clear bar
item replace entity @s hotbar.0 with minecraft:air
item replace entity @s hotbar.1 with minecraft:air
item replace entity @s hotbar.2 with minecraft:air
item replace entity @s hotbar.3 with minecraft:air
item replace entity @s hotbar.4 with minecraft:air
item replace entity @s hotbar.5 with minecraft:air
item replace entity @s hotbar.6 with minecraft:air
item replace entity @s hotbar.7 with minecraft:air
item replace entity @s hotbar.8 with minecraft:air